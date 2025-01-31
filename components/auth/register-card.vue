<script setup lang="ts">
import { useForm } from "vee-validate";
import { toTypedSchema } from "@vee-validate/zod";
import * as z from "zod";

const agreement = ref(false);

watch(agreement, (newVal) => {
  form.setFieldValue("agree", newVal);
  console.log("agreement", form.values);
});

const passRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
const formSchema = toTypedSchema(
  z.object({
    // TODO - Fix username validation during sign up
    // username: z
    //   .string()
    //   .min(5, "Username must be at least 5 characters.")
    //   .max(25, "Username must be less than 25 characters.")
    //   .regex(
    //     /^[a-zA-Z0-9_]*$/,
    //     "Username can only contain letters, numbers, and underscores."
    //   )
    //   .refine((data) => !["admin", "super_admin", "moderator"].includes(data), {
    //     message: "Username cannot be 'admin'.",
    //   })
    //   .refine((username) => {
    //     let timeout: NodeJS.Timeout;
    //     timeout = setTimeout(async () => {
    //       console.log("checking username...");
    //       clearTimeout(timeout);
    //       const { data: profiles } = await supabase
    //         .from("profiles")
    //         .select("username")
    //         .eq("username", username);
    //       console.log("profiles", profiles);
    //       return profiles && profiles.length !== 0;
    //     }, 2000);
    //   }),
    email: z.string().email().trim(),
    auth: z
      .object({
        password: z.string().regex(passRegex, {
          message:
            "Password must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number.",
        }),
        confirmPassword: z.string(),
      })
      .refine((data) => data.password === data.confirmPassword, {
        message: "Passwords do not match.",
        path: ["confirmPassword"],
      }),
    agree: z.boolean().refine((data) => data === true, {
      message: "You must agree to the terms of service and privacy policy.",
    }),
  })
);

const form = useForm({
  validationSchema: formSchema,
  initialValues: {
    //ANCHOR - Uncomment the username field to enable username validation
    // username: "",
    email: "",
    auth: {
      password: "",
      confirmPassword: "",
    },
    agree: agreement.value,
  },
});

const onSubmit = form.handleSubmit(async (values) => {
  console.log("form submitted", values, form);
});

const formInputAttrs = [
  //ANCHOR - Uncomment the username field to enable username validation
  // {
  //   name: "username",
  //   label: "Username",
  //   type: "text",
  //   description: "This is your public display name.",
  //   message: "",
  // },
  {
    name: "email",
    label: "Email",
    type: "email",
    description: "We won't share or sell your personal information.",
    message: "",
  },
  {
    name: "auth.password",
    label: "Password",
    type: "password",
    description: "Password must be at least 8 characters.",
    message: "",
  },
  {
    name: "auth.confirmPassword",
    label: "Confirm Password",
    type: "password",
    description: "Confirm your password.",
    message: "",
  },
];
</script>

<template>
  <ShaCard class="w-full md:w-2/5">
    <ShaCardHeader>
      <ShaCardTitle>Register</ShaCardTitle>
      <ShaCardDescription
        >Sign up for a free account to unlock more features
      </ShaCardDescription>
    </ShaCardHeader>

    <ShaCardContent>
      <form class="space-y-4">
        <ShaFormField
          v-for="input in formInputAttrs"
          :key="input.name"
          :name="input.name"
          v-slot="{ componentField }"
        >
          <ShaFormItem class="relative pb-4">
            <ShaFormLabel class="align-bottom pr-2">{{
              input.label
            }}</ShaFormLabel>
            <ShaTooltipProvider>
              <ShaTooltip>
                <ShaTooltipTrigger @click="(e) => e.preventDefault()">
                  <Icon
                    name="mdi:help-box-outline"
                    size="16"
                    class="align-bottom cursor-pointer"
                  />
                </ShaTooltipTrigger>
                <ShaTooltipContent>
                  <ShaFormDescription class="text-xs text-muted">{{
                    input.description
                  }}</ShaFormDescription>
                </ShaTooltipContent>
              </ShaTooltip>
            </ShaTooltipProvider>
            <ShaFormControl>
              <ShaInput :type="input.type" v-bind="componentField" />
            </ShaFormControl>
            <ShaFormMessage class="text-danger absolute" />
          </ShaFormItem>
        </ShaFormField>
        <div class="flex items-center justify-center space-x-2">
          <ShaCheckbox
            id="terms"
            v-model="agreement"
            :checked="agreement"
            @update:checked="(e) => (agreement = e)"
          />
          <ShaLabel for="terms">
            I agree to the
            <NuxtLink class="link" to="/terms">Terms of Service</NuxtLink> and
            <NuxtLink class="link" to="/privacy">Privacy Policy</NuxtLink>
          </ShaLabel>
        </div>
        <ShaButton
          class="w-full !bg-primary hover:text-white"
          @click="onSubmit"
          :loading="form.isSubmitting"
          :disabled="form.values.agree === false"
        >
          Register
        </ShaButton>
      </form>
    </ShaCardContent>
    <ShaCardFooter class="flex flex-col items-center">
      <p>
        Already have an account?
        <NuxtLink class="link" to="/auth/login">Login here.</NuxtLink>
      </p>
    </ShaCardFooter>
  </ShaCard>
</template>
