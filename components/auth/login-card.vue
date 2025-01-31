<script setup lang="ts">
import { useForm } from "vee-validate";
import { toTypedSchema } from "@vee-validate/zod";
import * as z from "zod";

const supabase = useSupabaseClient();

const formSchema = toTypedSchema(
  z.object({
    email: z.string().email().trim(),
    password: z.string().min(8, "Password must be at least 8 characters."),
  })
);

const form = useForm({
  validationSchema: formSchema,
  initialValues: {
    email: "",
    password: "",
  },
});

const onSubmit = form.handleSubmit(async (values) => {
  try {
    const { data } = await supabase.auth.signInWithPassword({
      email: values.email,
      password: values.password,
    });
    if (data) {
      navigateTo("/confirm");
    }
  } catch (error) {
    console.error(error);
    throw createError("error with login");
  }
});

const formInputAttrs = [
  {
    name: "email",
    label: "Email",
    type: "email",
    description: "Enter your registered email.",
    message: "",
  },
  {
    name: "password",
    label: "Password",
    type: "password",
    description: "Enter your password.",
    message: "",
  },
];
</script>

<template>
  <ShaCard class="w-full md:w-2/5">
    <ShaCardHeader>
      <ShaCardTitle>Login</ShaCardTitle>
      <ShaCardDescription>Access your account</ShaCardDescription>
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
        <ShaButton
          class="w-full !bg-primary hover:text-white"
          @click="onSubmit"
          :loading="form.isSubmitting"
        >
          Login
        </ShaButton>
      </form>
    </ShaCardContent>
    <ShaCardFooter class="flex flex-col items-center">
      <p>
        Don't have an account?
        <NuxtLink class="link" to="/auth/register">Register here.</NuxtLink>
      </p>
    </ShaCardFooter>
  </ShaCard>
</template>
