CREATE TABLE "users" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "login" varchar NOT NULL,
  "password_digest" varchar NOT NULL,
  "profile_picture" varchar NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "user_groups" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "group_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "group_role_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "groups" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "owner_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL,
  "is_public" boolean DEFAULT false NOT NULL
);

CREATE TABLE "group_products" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "group_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "friends" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "requester_id" uuid NOT NULL,
  "requestee_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL,
  "is_accepted" boolean DEFAULT false NOT NULL
);

CREATE TABLE "products" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "owner_id" uuid NOT NULL,
  "default_price" numeric(10,2) NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "sub_products" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "product_id" uuid NOT NULL,
  "description" varchar NOT NULL,
  "default_price" numeric(10,2) NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "orders" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "owner_id" uuid NOT NULL,
  "pay_to" uuid NOT NULL,
  "shipping_value" numeric(10,2) NULL,
  "shipping_split_id" uuid NULL,
  "item_split_id" uuid NULL,
  "coupon_split_id" uuid NULL,
  "coupon_value" numeric(10,2) NULL,
  "is_coupon_percentage" boolean NULL DEFAULT false,
  "status_id" uuid NOT NULL,
  "min_order" numeric(10,2) NULL,
  "max_order" numeric(10,2) NULL,
  "order_deadline" timestamp NULL,
  "estimated_delivery" timestamp NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "order_users" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "order_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "role_id" uuid NOT NULL,
  "added_by" uuid NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "order_groups" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "order_id" uuid NOT NULL,
  "group_id" uuid NOT NULL,
  "role_id" uuid NOT NULL,
  "added_by" uuid NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "order_roles" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "order_shares" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "token" varchar UNIQUE NOT NULL,
  "order_id" uuid NOT NULL,
  "role_id" uuid NOT NULL,
  "is_active" boolean DEFAULT true NOT NULL,
  "expires_at" timestamp NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "group_roles" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "group_invitations" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "group_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "inviter_id" uuid NULL,
  "status_id" uuid NOT NULL,
  "is_invite" boolean NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "invite_status" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "split_types" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "order_status" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "available_products_orders" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "order_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "sub_product_id" uuid NULL,
  "price" numeric(10,2) NULL,
  "min_order" numeric(10,2) NULL,
  "max_order" numeric(10,2) NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "user_products_orders" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "user_id" uuid NOT NULL,
  "order_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "sub_product_id" uuid NULL,
  "quantity" numeric(10,2) NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "user_payments" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "order_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "amount_due" numeric(10,2) NOT NULL,
  "amount_paid" numeric(10,2) DEFAULT 0 NOT NULL,
  "payment_method_id" uuid NULL,
  "payment_status_id" uuid NOT NULL,
  "payment_date" timestamp NULL,
  "covered_by_user_id" uuid NULL,
  "is_payback_expected" boolean DEFAULT false NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "user_covering_paybacks" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "covered_payment_id" uuid NOT NULL,
  "amount" numeric(10,2) NOT NULL,
  "payback_status_id" uuid NOT NULL,
  "payback_date" timestamp NULL,
  "payback_method_id" uuid NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL
);

CREATE TABLE "payback_status" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "payment_status" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "payment_methods" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "user_product_customizations" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "user_product_order_id" uuid NOT NULL,
  "customization_text" varchar NOT NULL,
  "additional_price" numeric(10,2) DEFAULT 0 NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "notifications" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "user_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "message" text NOT NULL,
  "is_read" boolean DEFAULT false NOT NULL,
  "notification_type_id" uuid NOT NULL,
  "related_id" uuid NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "notification_types" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "description" varchar NOT NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "updated_at" timestamp NULL,
  "deleted_at" timestamp NULL
);

CREATE TABLE "order_history" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "order_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "action" varchar NOT NULL,
  "description" text NULL,
  "created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX ON "friends" ("requester_id", "requestee_id");

ALTER TABLE "user_groups" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "user_groups" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_groups" ADD FOREIGN KEY ("group_role_id") REFERENCES "group_roles" ("id");

ALTER TABLE "groups" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "group_products" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "group_products" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("requester_id") REFERENCES "users" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("requestee_id") REFERENCES "users" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "sub_products" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("pay_to") REFERENCES "users" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("shipping_split_id") REFERENCES "split_types" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("item_split_id") REFERENCES "split_types" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("coupon_split_id") REFERENCES "split_types" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("status_id") REFERENCES "order_status" ("id");

ALTER TABLE "order_users" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "order_users" ADD FOREIGN KEY ("role_id") REFERENCES "order_roles" ("id");

ALTER TABLE "order_users" ADD FOREIGN KEY ("added_by") REFERENCES "users" ("id");

ALTER TABLE "order_groups" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_groups" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "order_groups" ADD FOREIGN KEY ("role_id") REFERENCES "order_roles" ("id");

ALTER TABLE "order_groups" ADD FOREIGN KEY ("added_by") REFERENCES "users" ("id");

ALTER TABLE "order_shares" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_shares" ADD FOREIGN KEY ("role_id") REFERENCES "order_roles" ("id");

ALTER TABLE "group_invitations" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id");

ALTER TABLE "group_invitations" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "group_invitations" ADD FOREIGN KEY ("inviter_id") REFERENCES "users" ("id");

ALTER TABLE "group_invitations" ADD FOREIGN KEY ("status_id") REFERENCES "invite_status" ("id");

ALTER TABLE "available_products_orders" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "available_products_orders" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "available_products_orders" ADD FOREIGN KEY ("sub_product_id") REFERENCES "sub_products" ("id");

ALTER TABLE "user_products_orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_products_orders" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "user_products_orders" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "user_products_orders" ADD FOREIGN KEY ("sub_product_id") REFERENCES "sub_products" ("id");

ALTER TABLE "user_payments" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "user_payments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_payments" ADD FOREIGN KEY ("payment_method_id") REFERENCES "payment_methods" ("id");

ALTER TABLE "user_payments" ADD FOREIGN KEY ("payment_status_id") REFERENCES "payment_status" ("id");

ALTER TABLE "user_payments" ADD FOREIGN KEY ("covered_by_user_id") REFERENCES "users" ("id");

ALTER TABLE "user_covering_paybacks" ADD FOREIGN KEY ("covered_payment_id") REFERENCES "user_payments" ("id");

ALTER TABLE "user_covering_paybacks" ADD FOREIGN KEY ("payback_status_id") REFERENCES "payback_status" ("id");

ALTER TABLE "user_covering_paybacks" ADD FOREIGN KEY ("payback_method_id") REFERENCES "payment_methods" ("id");

ALTER TABLE "user_product_customizations" ADD FOREIGN KEY ("user_product_order_id") REFERENCES "user_products_orders" ("id");

ALTER TABLE "notifications" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "notifications" ADD FOREIGN KEY ("notification_type_id") REFERENCES "notification_types" ("id");

ALTER TABLE "order_history" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_history" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
