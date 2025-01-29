create table "public"."cards" (
    "id" bigint generated by default as identity not null,
    "title" character varying not null default ''::character varying,
    "slug_id" character varying,
    "rank_int" numeric,
    "upright_keywords" text,
    "reversed_keywords" text,
    "reversed_description" text,
    "upright_description" text,
    "fools_journey" text,
    "arcana" text
);


alter table "public"."cards" enable row level security;

create table "public"."profiles" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid,
    "screen_name" text not null
);


alter table "public"."profiles" enable row level security;

create table "public"."spread_placement_cards" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "spread_id" bigint,
    "sequence" numeric not null,
    "raw_transform_css" text not null default ''::text,
    "author" text,
    "label" text not null,
    "rotation_deg" numeric,
    "y_axis" numeric,
    "x_axis" numeric
);


alter table "public"."spread_placement_cards" enable row level security;

create table "public"."spreads" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "profile_id" bigint,
    "title" text,
    "private" boolean not null default false,
    "updated_at" timestamp without time zone
);


alter table "public"."spreads" enable row level security;

CREATE UNIQUE INDEX cards_pkey ON public.cards USING btree (id);

CREATE UNIQUE INDEX cards_slug_id_key ON public.cards USING btree (slug_id);

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX profiles_screen_name_key ON public.profiles USING btree (screen_name);

CREATE UNIQUE INDEX spread_placement_cards_pkey ON public.spread_placement_cards USING btree (id);

CREATE UNIQUE INDEX spreads_pkey ON public.spreads USING btree (id);

alter table "public"."cards" add constraint "cards_pkey" PRIMARY KEY using index "cards_pkey";

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."spread_placement_cards" add constraint "spread_placement_cards_pkey" PRIMARY KEY using index "spread_placement_cards_pkey";

alter table "public"."spreads" add constraint "spreads_pkey" PRIMARY KEY using index "spreads_pkey";

alter table "public"."cards" add constraint "cards_slug_id_key" UNIQUE using index "cards_slug_id_key";

alter table "public"."profiles" add constraint "profiles_screen_name_key" UNIQUE using index "profiles_screen_name_key";

alter table "public"."profiles" add constraint "profiles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_user_id_fkey";

alter table "public"."spread_placement_cards" add constraint "spread_placement_cards_author_fkey" FOREIGN KEY (author) REFERENCES profiles(screen_name) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."spread_placement_cards" validate constraint "spread_placement_cards_author_fkey";

alter table "public"."spread_placement_cards" add constraint "spread_placement_cards_spread_id_fkey" FOREIGN KEY (spread_id) REFERENCES spreads(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."spread_placement_cards" validate constraint "spread_placement_cards_spread_id_fkey";

alter table "public"."spreads" add constraint "spreads_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES profiles(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."spreads" validate constraint "spreads_profile_id_fkey";

grant delete on table "public"."cards" to "anon";

grant insert on table "public"."cards" to "anon";

grant references on table "public"."cards" to "anon";

grant select on table "public"."cards" to "anon";

grant trigger on table "public"."cards" to "anon";

grant truncate on table "public"."cards" to "anon";

grant update on table "public"."cards" to "anon";

grant delete on table "public"."cards" to "authenticated";

grant insert on table "public"."cards" to "authenticated";

grant references on table "public"."cards" to "authenticated";

grant select on table "public"."cards" to "authenticated";

grant trigger on table "public"."cards" to "authenticated";

grant truncate on table "public"."cards" to "authenticated";

grant update on table "public"."cards" to "authenticated";

grant delete on table "public"."cards" to "service_role";

grant insert on table "public"."cards" to "service_role";

grant references on table "public"."cards" to "service_role";

grant select on table "public"."cards" to "service_role";

grant trigger on table "public"."cards" to "service_role";

grant truncate on table "public"."cards" to "service_role";

grant update on table "public"."cards" to "service_role";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."spread_placement_cards" to "anon";

grant insert on table "public"."spread_placement_cards" to "anon";

grant references on table "public"."spread_placement_cards" to "anon";

grant select on table "public"."spread_placement_cards" to "anon";

grant trigger on table "public"."spread_placement_cards" to "anon";

grant truncate on table "public"."spread_placement_cards" to "anon";

grant update on table "public"."spread_placement_cards" to "anon";

grant delete on table "public"."spread_placement_cards" to "authenticated";

grant insert on table "public"."spread_placement_cards" to "authenticated";

grant references on table "public"."spread_placement_cards" to "authenticated";

grant select on table "public"."spread_placement_cards" to "authenticated";

grant trigger on table "public"."spread_placement_cards" to "authenticated";

grant truncate on table "public"."spread_placement_cards" to "authenticated";

grant update on table "public"."spread_placement_cards" to "authenticated";

grant delete on table "public"."spread_placement_cards" to "service_role";

grant insert on table "public"."spread_placement_cards" to "service_role";

grant references on table "public"."spread_placement_cards" to "service_role";

grant select on table "public"."spread_placement_cards" to "service_role";

grant trigger on table "public"."spread_placement_cards" to "service_role";

grant truncate on table "public"."spread_placement_cards" to "service_role";

grant update on table "public"."spread_placement_cards" to "service_role";

grant delete on table "public"."spreads" to "anon";

grant insert on table "public"."spreads" to "anon";

grant references on table "public"."spreads" to "anon";

grant select on table "public"."spreads" to "anon";

grant trigger on table "public"."spreads" to "anon";

grant truncate on table "public"."spreads" to "anon";

grant update on table "public"."spreads" to "anon";

grant delete on table "public"."spreads" to "authenticated";

grant insert on table "public"."spreads" to "authenticated";

grant references on table "public"."spreads" to "authenticated";

grant select on table "public"."spreads" to "authenticated";

grant trigger on table "public"."spreads" to "authenticated";

grant truncate on table "public"."spreads" to "authenticated";

grant update on table "public"."spreads" to "authenticated";

grant delete on table "public"."spreads" to "service_role";

grant insert on table "public"."spreads" to "service_role";

grant references on table "public"."spreads" to "service_role";

grant select on table "public"."spreads" to "service_role";

grant trigger on table "public"."spreads" to "service_role";

grant truncate on table "public"."spreads" to "service_role";

grant update on table "public"."spreads" to "service_role";

create policy "Enable read access for all users"
on "public"."cards"
as permissive
for select
to public
using (true);



