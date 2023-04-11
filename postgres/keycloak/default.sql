--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO postgres;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO postgres;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO postgres;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO postgres;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO postgres;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO postgres;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO postgres;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO postgres;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO postgres;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO postgres;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO postgres;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO postgres;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO postgres;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO postgres;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO postgres;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO postgres;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO postgres;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO postgres;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO postgres;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO postgres;

--
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO postgres;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO postgres;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO postgres;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO postgres;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO postgres;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO postgres;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO postgres;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO postgres;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO postgres;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO postgres;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO postgres;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO postgres;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO postgres;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO postgres;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO postgres;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO postgres;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO postgres;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO postgres;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO postgres;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO postgres;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO postgres;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO postgres;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO postgres;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO postgres;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO postgres;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO postgres;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO postgres;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO postgres;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO postgres;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO postgres;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO postgres;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO postgres;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO postgres;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO postgres;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO postgres;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO postgres;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO postgres;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO postgres;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO postgres;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO postgres;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO postgres;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO postgres;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO postgres;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO postgres;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO postgres;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO postgres;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO postgres;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO postgres;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO postgres;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO postgres;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO postgres;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO postgres;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO postgres;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO postgres;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO postgres;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO postgres;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO postgres;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO postgres;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO postgres;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO postgres;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO postgres;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO postgres;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO postgres;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO postgres;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
45d76212-81ec-4392-96ae-f15489f70976	\N	auth-cookie	1fe32191-f201-4478-b052-d3f2fd3c61d1	95cdea80-1925-4c4f-881f-3789b39274e2	2	10	f	\N	\N
2c018012-84d1-4126-8862-e104596068d0	\N	auth-spnego	1fe32191-f201-4478-b052-d3f2fd3c61d1	95cdea80-1925-4c4f-881f-3789b39274e2	3	20	f	\N	\N
dca03ebb-24c0-4fcb-be53-cc85a2b69d99	\N	identity-provider-redirector	1fe32191-f201-4478-b052-d3f2fd3c61d1	95cdea80-1925-4c4f-881f-3789b39274e2	2	25	f	\N	\N
c018fe9d-0289-4ca6-a811-b57e02a79778	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	95cdea80-1925-4c4f-881f-3789b39274e2	2	30	t	447420f5-4540-4c2c-bfea-48361722e09c	\N
a3537517-8a18-4c8b-802a-7a6275ac424d	\N	auth-username-password-form	1fe32191-f201-4478-b052-d3f2fd3c61d1	447420f5-4540-4c2c-bfea-48361722e09c	0	10	f	\N	\N
9224ebca-96dc-4aed-8a0c-e566740d8ddb	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	447420f5-4540-4c2c-bfea-48361722e09c	1	20	t	3e047b0f-8f94-498a-ae29-8f0700ee956e	\N
fc6e59b0-39c1-41be-a44d-f43c1fa4e103	\N	conditional-user-configured	1fe32191-f201-4478-b052-d3f2fd3c61d1	3e047b0f-8f94-498a-ae29-8f0700ee956e	0	10	f	\N	\N
bedd45bb-923c-43da-a06c-25ec1ea52360	\N	auth-otp-form	1fe32191-f201-4478-b052-d3f2fd3c61d1	3e047b0f-8f94-498a-ae29-8f0700ee956e	0	20	f	\N	\N
f4bd25d0-7ea7-4e2f-9ec1-ed171654eb3e	\N	direct-grant-validate-username	1fe32191-f201-4478-b052-d3f2fd3c61d1	ff41a012-596b-4237-81fa-d6ca72da4296	0	10	f	\N	\N
6f937577-f61e-4cbf-bb6e-2ebb7f2a68d7	\N	direct-grant-validate-password	1fe32191-f201-4478-b052-d3f2fd3c61d1	ff41a012-596b-4237-81fa-d6ca72da4296	0	20	f	\N	\N
136f8316-dacd-4df9-97bb-bd16d2ffcef3	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	ff41a012-596b-4237-81fa-d6ca72da4296	1	30	t	e814358f-034f-4cfe-b5f1-5c9b3647cdd6	\N
6ff950bc-427e-44c8-a2de-b1b3bf7e5cbd	\N	conditional-user-configured	1fe32191-f201-4478-b052-d3f2fd3c61d1	e814358f-034f-4cfe-b5f1-5c9b3647cdd6	0	10	f	\N	\N
e2069428-ff0d-4168-bddd-d02899c8aced	\N	direct-grant-validate-otp	1fe32191-f201-4478-b052-d3f2fd3c61d1	e814358f-034f-4cfe-b5f1-5c9b3647cdd6	0	20	f	\N	\N
9664f89c-9380-4b32-bb2b-467ebfd3696e	\N	registration-page-form	1fe32191-f201-4478-b052-d3f2fd3c61d1	66963d32-25d8-4596-ae14-f906ff1c946b	0	10	t	7f27b42f-d9b7-447d-9db7-1e2da4b567bc	\N
0e25e23f-7f3a-49eb-a139-0825ac95996a	\N	registration-user-creation	1fe32191-f201-4478-b052-d3f2fd3c61d1	7f27b42f-d9b7-447d-9db7-1e2da4b567bc	0	20	f	\N	\N
b655ad5d-101e-4f0f-a456-44bb2d0f03f6	\N	registration-profile-action	1fe32191-f201-4478-b052-d3f2fd3c61d1	7f27b42f-d9b7-447d-9db7-1e2da4b567bc	0	40	f	\N	\N
946d0545-14ba-4aac-8273-698590cfbbc8	\N	registration-password-action	1fe32191-f201-4478-b052-d3f2fd3c61d1	7f27b42f-d9b7-447d-9db7-1e2da4b567bc	0	50	f	\N	\N
b1256d34-8464-4f63-9522-5ddbd28529a6	\N	registration-recaptcha-action	1fe32191-f201-4478-b052-d3f2fd3c61d1	7f27b42f-d9b7-447d-9db7-1e2da4b567bc	3	60	f	\N	\N
f9887455-f4d8-48ac-95f2-ea9a21e2bb88	\N	reset-credentials-choose-user	1fe32191-f201-4478-b052-d3f2fd3c61d1	1d34eff6-9603-45be-ba0b-adefffbc79e9	0	10	f	\N	\N
dcd74380-9e7c-45b0-af7c-2ce1f0e15536	\N	reset-credential-email	1fe32191-f201-4478-b052-d3f2fd3c61d1	1d34eff6-9603-45be-ba0b-adefffbc79e9	0	20	f	\N	\N
2cb7b507-370b-4e2a-9e73-f574262cfbc7	\N	reset-password	1fe32191-f201-4478-b052-d3f2fd3c61d1	1d34eff6-9603-45be-ba0b-adefffbc79e9	0	30	f	\N	\N
1a284413-f75c-44d6-a775-c1e7ef0340f8	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	1d34eff6-9603-45be-ba0b-adefffbc79e9	1	40	t	4c5f54db-bf88-4331-a5dd-94c6b91fa702	\N
5a1a7777-04d8-47f9-833c-08425091e93b	\N	conditional-user-configured	1fe32191-f201-4478-b052-d3f2fd3c61d1	4c5f54db-bf88-4331-a5dd-94c6b91fa702	0	10	f	\N	\N
faeac694-14a5-4597-ab5b-373840042690	\N	reset-otp	1fe32191-f201-4478-b052-d3f2fd3c61d1	4c5f54db-bf88-4331-a5dd-94c6b91fa702	0	20	f	\N	\N
6a93416d-868d-4b63-a589-b6f47f05d6d4	\N	client-secret	1fe32191-f201-4478-b052-d3f2fd3c61d1	368b0e28-04c3-4613-8674-ece6a59c8016	2	10	f	\N	\N
a354fce7-5e0d-474c-ac0d-fc789138e664	\N	client-jwt	1fe32191-f201-4478-b052-d3f2fd3c61d1	368b0e28-04c3-4613-8674-ece6a59c8016	2	20	f	\N	\N
b1f83e9f-226d-4094-9b2a-14225bb3d76c	\N	client-secret-jwt	1fe32191-f201-4478-b052-d3f2fd3c61d1	368b0e28-04c3-4613-8674-ece6a59c8016	2	30	f	\N	\N
49efe259-6039-43c6-b0f1-e210751ae4ad	\N	client-x509	1fe32191-f201-4478-b052-d3f2fd3c61d1	368b0e28-04c3-4613-8674-ece6a59c8016	2	40	f	\N	\N
68ac7510-a9b9-4647-871f-decf53c28010	\N	idp-review-profile	1fe32191-f201-4478-b052-d3f2fd3c61d1	1dc7fc4c-e077-4734-ab75-db10e695c17d	0	10	f	\N	c08ec249-4304-48ac-8993-79cfdd711850
83109dcd-44ea-4681-ab8c-d207dbceea67	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	1dc7fc4c-e077-4734-ab75-db10e695c17d	0	20	t	d1c2220d-2d9d-480b-9069-9ec6644a4232	\N
7d852cdd-2435-4ce9-959f-7941363d1d6e	\N	idp-create-user-if-unique	1fe32191-f201-4478-b052-d3f2fd3c61d1	d1c2220d-2d9d-480b-9069-9ec6644a4232	2	10	f	\N	f221a1fe-4bef-4bc1-8dda-17097213557e
a2f987f0-65d5-4a4d-ae43-092b605d5f19	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	d1c2220d-2d9d-480b-9069-9ec6644a4232	2	20	t	17dd3c6c-ed53-4a72-af8e-4765c4ca2fa5	\N
c53ddc5c-7199-46c8-9c0d-f49103b680a9	\N	idp-confirm-link	1fe32191-f201-4478-b052-d3f2fd3c61d1	17dd3c6c-ed53-4a72-af8e-4765c4ca2fa5	0	10	f	\N	\N
58434b3b-de5b-40e8-ae36-14f350011056	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	17dd3c6c-ed53-4a72-af8e-4765c4ca2fa5	0	20	t	64846ca5-a708-4107-8ed3-b26567450b3d	\N
1cd46b03-6803-46ee-a2c2-5797de056366	\N	idp-email-verification	1fe32191-f201-4478-b052-d3f2fd3c61d1	64846ca5-a708-4107-8ed3-b26567450b3d	2	10	f	\N	\N
161bbd4a-c634-447d-a0d8-895757771593	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	64846ca5-a708-4107-8ed3-b26567450b3d	2	20	t	129ba7af-878d-40ad-b466-00e483796b95	\N
d2833568-6c6e-4b2c-b6f7-7cd7b63df0c5	\N	idp-username-password-form	1fe32191-f201-4478-b052-d3f2fd3c61d1	129ba7af-878d-40ad-b466-00e483796b95	0	10	f	\N	\N
85714c2e-b722-4a61-9e1f-6a76373fa0af	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	129ba7af-878d-40ad-b466-00e483796b95	1	20	t	0a5e95a0-55b0-4ed2-8404-1fa81752da5a	\N
1dd9c560-0a19-4113-a6be-247906b66824	\N	conditional-user-configured	1fe32191-f201-4478-b052-d3f2fd3c61d1	0a5e95a0-55b0-4ed2-8404-1fa81752da5a	0	10	f	\N	\N
6f9bf5bf-f90a-4a2c-aeb9-85a600a902be	\N	auth-otp-form	1fe32191-f201-4478-b052-d3f2fd3c61d1	0a5e95a0-55b0-4ed2-8404-1fa81752da5a	0	20	f	\N	\N
668336ab-d074-4c38-a434-1192d8d56a68	\N	http-basic-authenticator	1fe32191-f201-4478-b052-d3f2fd3c61d1	506c2511-e627-4cdf-b0bc-fa81aa5d6d72	0	10	f	\N	\N
c6f7e7b6-7cb3-45be-b5fe-ac1cfdfd3674	\N	docker-http-basic-authenticator	1fe32191-f201-4478-b052-d3f2fd3c61d1	d74bb65d-06ce-457a-9bf0-e1a8e74a9770	0	10	f	\N	\N
294e64cf-02e7-453e-a467-16f6164aff6c	\N	no-cookie-redirect	1fe32191-f201-4478-b052-d3f2fd3c61d1	d56988f2-8108-439c-bcc1-f6f273b64acf	0	10	f	\N	\N
7dc1fd37-43a7-4acf-afbb-066d7172f690	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	d56988f2-8108-439c-bcc1-f6f273b64acf	0	20	t	fd05a317-a127-491e-9671-6ef0e2040968	\N
7f48aca1-1cfa-4cb0-b8eb-2c71903178df	\N	basic-auth	1fe32191-f201-4478-b052-d3f2fd3c61d1	fd05a317-a127-491e-9671-6ef0e2040968	0	10	f	\N	\N
ea8c772a-74a3-4fe3-8d71-62004db157a4	\N	basic-auth-otp	1fe32191-f201-4478-b052-d3f2fd3c61d1	fd05a317-a127-491e-9671-6ef0e2040968	3	20	f	\N	\N
48eafc04-e557-4e8d-9114-56371ceaa954	\N	auth-spnego	1fe32191-f201-4478-b052-d3f2fd3c61d1	fd05a317-a127-491e-9671-6ef0e2040968	3	30	f	\N	\N
c87f192a-9cfe-42e5-a3f5-2262137bf06c	\N	auth-cookie	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	c039d103-48d9-4fb4-b6f4-7259be670fc8	2	10	f	\N	\N
336cac3c-d5fa-4ca4-8116-842483c71a3d	\N	auth-spnego	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	c039d103-48d9-4fb4-b6f4-7259be670fc8	3	20	f	\N	\N
e302904d-6e43-4cab-934f-815bcf1c33f1	\N	identity-provider-redirector	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	c039d103-48d9-4fb4-b6f4-7259be670fc8	2	25	f	\N	\N
ea7989e5-d8db-4933-a336-eb8e171a9abe	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	c039d103-48d9-4fb4-b6f4-7259be670fc8	2	30	t	52b920c4-b4b2-42bb-a89f-7c8dde867d7c	\N
60b193cc-42bd-484a-af40-3eeacbd7a436	\N	auth-username-password-form	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	52b920c4-b4b2-42bb-a89f-7c8dde867d7c	0	10	f	\N	\N
0de95741-8464-4ade-8d8b-208cbf81b9da	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	52b920c4-b4b2-42bb-a89f-7c8dde867d7c	1	20	t	3afca6c2-377e-49cd-a8c5-363117afa5fc	\N
30d23cc0-b05a-40aa-8b53-f4267ccef386	\N	conditional-user-configured	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	3afca6c2-377e-49cd-a8c5-363117afa5fc	0	10	f	\N	\N
5970f48d-1a4e-4240-a0c7-01c1cdd701ae	\N	auth-otp-form	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	3afca6c2-377e-49cd-a8c5-363117afa5fc	0	20	f	\N	\N
92cffd0f-f8fd-4dc0-9cce-ffdd6b7c2c76	\N	direct-grant-validate-username	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	3aaf64b2-a83b-45c8-ab0f-12fb5f28ff30	0	10	f	\N	\N
f3f407e1-b3e7-4646-985e-3facf7f2b22f	\N	direct-grant-validate-password	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	3aaf64b2-a83b-45c8-ab0f-12fb5f28ff30	0	20	f	\N	\N
66093b28-cbc1-409e-a4a0-4b6904338ac5	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	3aaf64b2-a83b-45c8-ab0f-12fb5f28ff30	1	30	t	379409f3-efd7-4a87-8c49-058d1c4ea21b	\N
54526807-c1d7-4f16-bed9-1bde74c0a710	\N	conditional-user-configured	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	379409f3-efd7-4a87-8c49-058d1c4ea21b	0	10	f	\N	\N
83de9276-5f0b-42f2-ae8f-0045ec266790	\N	direct-grant-validate-otp	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	379409f3-efd7-4a87-8c49-058d1c4ea21b	0	20	f	\N	\N
f2b2e9c5-afa2-4441-8271-36e2ea771a7b	\N	registration-page-form	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	be211627-d131-4272-a4bb-a49e1c4ea75f	0	10	t	a5c07230-4bd0-45de-87e9-cdcb3415e159	\N
f5f80175-7d56-4c37-87fa-213f4a41ce79	\N	registration-user-creation	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	a5c07230-4bd0-45de-87e9-cdcb3415e159	0	20	f	\N	\N
9c35b3b5-ff7d-4dd0-b9c0-45c3de62d1c0	\N	registration-profile-action	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	a5c07230-4bd0-45de-87e9-cdcb3415e159	0	40	f	\N	\N
f95c624b-8bc5-44bd-88af-968bd70f4ec7	\N	registration-password-action	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	a5c07230-4bd0-45de-87e9-cdcb3415e159	0	50	f	\N	\N
bf4ce40f-9172-4394-8c63-3de430212e93	\N	registration-recaptcha-action	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	a5c07230-4bd0-45de-87e9-cdcb3415e159	3	60	f	\N	\N
087b4253-c0b4-4516-bbb0-82279ab24447	\N	reset-credentials-choose-user	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	acccee70-52e7-4640-8142-f14355aa1c73	0	10	f	\N	\N
3aed66a9-9af8-4911-88c1-ae64c1df4056	\N	reset-credential-email	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	acccee70-52e7-4640-8142-f14355aa1c73	0	20	f	\N	\N
0c452ae0-ceff-4767-842e-5b9b46c0f287	\N	reset-password	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	acccee70-52e7-4640-8142-f14355aa1c73	0	30	f	\N	\N
8ef3c5b3-2c0e-4e80-9109-5ba66e2f3e1e	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	acccee70-52e7-4640-8142-f14355aa1c73	1	40	t	dc71d962-3f7c-434f-a961-b1f3c675fec2	\N
3a937886-23e7-4d43-9911-27b2ee8d5c4d	\N	conditional-user-configured	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	dc71d962-3f7c-434f-a961-b1f3c675fec2	0	10	f	\N	\N
082a3e7b-af49-438d-bb37-8031075c68e4	\N	reset-otp	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	dc71d962-3f7c-434f-a961-b1f3c675fec2	0	20	f	\N	\N
b7be7e58-aba9-46db-b51d-c0dc8d3324ff	\N	client-secret	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	057030fc-ba4c-4ef5-b22b-e6e1932ed96e	2	10	f	\N	\N
e72eae37-1b0d-4e23-ac56-82040d064f99	\N	client-jwt	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	057030fc-ba4c-4ef5-b22b-e6e1932ed96e	2	20	f	\N	\N
43dfc93e-11a3-462d-815f-2d7260bba025	\N	client-secret-jwt	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	057030fc-ba4c-4ef5-b22b-e6e1932ed96e	2	30	f	\N	\N
5865c08e-4404-493c-8f84-b505ba737958	\N	client-x509	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	057030fc-ba4c-4ef5-b22b-e6e1932ed96e	2	40	f	\N	\N
69c9d1d2-6bbc-41ba-8f6c-0c237c47be3f	\N	idp-review-profile	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	8687e160-9668-466c-bd37-7d6da786a424	0	10	f	\N	bcd13c99-fe20-4017-a6ea-299612a7b9a3
fd1894ac-63d5-450e-9aaa-6d0c05352956	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	8687e160-9668-466c-bd37-7d6da786a424	0	20	t	838ad70d-6e0a-4e24-97f7-2836122003aa	\N
808301f7-f3ca-414b-b2f1-ac49f2cf64a9	\N	idp-create-user-if-unique	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	838ad70d-6e0a-4e24-97f7-2836122003aa	2	10	f	\N	e2d5af92-6b11-4f6c-95dd-f02f90cd9f4a
8bb5182c-6e9d-40e9-a70a-dcd60ba8cfae	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	838ad70d-6e0a-4e24-97f7-2836122003aa	2	20	t	93543b13-c316-4755-8a76-f4d788ebc97a	\N
72b7d8a3-c77f-4d49-96f5-1ebace26a799	\N	idp-confirm-link	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	93543b13-c316-4755-8a76-f4d788ebc97a	0	10	f	\N	\N
c7ba4ca4-c144-4e7e-855a-0003e5c932a0	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	93543b13-c316-4755-8a76-f4d788ebc97a	0	20	t	583ddfd6-89f7-4c2e-9cdb-ca0d4ba9a82b	\N
03d7ec65-c219-4e72-a3f5-4bb2c2985914	\N	idp-email-verification	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	583ddfd6-89f7-4c2e-9cdb-ca0d4ba9a82b	2	10	f	\N	\N
12dab3f2-9686-49e3-9386-6c002b2da40d	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	583ddfd6-89f7-4c2e-9cdb-ca0d4ba9a82b	2	20	t	fe4bcddc-31e5-47ac-bff0-03be93746959	\N
da1bf233-c231-418e-9551-4887301c7087	\N	idp-username-password-form	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	fe4bcddc-31e5-47ac-bff0-03be93746959	0	10	f	\N	\N
755dec1f-21b4-45f6-b9f0-e2afba00e7d4	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	fe4bcddc-31e5-47ac-bff0-03be93746959	1	20	t	d2da2d2e-d14a-4b9f-8577-ed6c9b025b3a	\N
a937939b-7d5b-4b4c-b7b7-41e6fab76219	\N	conditional-user-configured	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	d2da2d2e-d14a-4b9f-8577-ed6c9b025b3a	0	10	f	\N	\N
b17470dd-ad3f-42ff-8dde-e9f90c8996f3	\N	auth-otp-form	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	d2da2d2e-d14a-4b9f-8577-ed6c9b025b3a	0	20	f	\N	\N
e5138cad-e1c0-422e-97af-3b8c83fccceb	\N	http-basic-authenticator	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	3c12877c-c252-4efe-b5b0-2f37146db6aa	0	10	f	\N	\N
568a265b-ce58-4d35-b330-129a54a792f9	\N	docker-http-basic-authenticator	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	9828ce2e-62c3-47e4-bdc0-0bdc39fb0dee	0	10	f	\N	\N
43ba0e28-0ca2-414f-ab48-975cbf2aa3a2	\N	no-cookie-redirect	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	b7a0f1e5-6106-4efd-8fb8-ea121126c7fb	0	10	f	\N	\N
d00c5a3c-4a76-4b58-aa16-efb0a37c9bfe	\N	\N	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	b7a0f1e5-6106-4efd-8fb8-ea121126c7fb	0	20	t	842871f8-7cd4-4aef-a532-c709510369db	\N
5d211e3f-b5d3-4e8c-a405-dc2d0d64177a	\N	basic-auth	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	842871f8-7cd4-4aef-a532-c709510369db	0	10	f	\N	\N
600d120e-08e9-4b5e-b25e-df59f441aa48	\N	basic-auth-otp	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	842871f8-7cd4-4aef-a532-c709510369db	3	20	f	\N	\N
65135d07-931e-4aff-95d2-4ac2a198bb6c	\N	auth-spnego	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	842871f8-7cd4-4aef-a532-c709510369db	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
95cdea80-1925-4c4f-881f-3789b39274e2	browser	browser based authentication	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
447420f5-4540-4c2c-bfea-48361722e09c	forms	Username, password, otp and other auth forms.	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
3e047b0f-8f94-498a-ae29-8f0700ee956e	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
ff41a012-596b-4237-81fa-d6ca72da4296	direct grant	OpenID Connect Resource Owner Grant	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
e814358f-034f-4cfe-b5f1-5c9b3647cdd6	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
66963d32-25d8-4596-ae14-f906ff1c946b	registration	registration flow	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
7f27b42f-d9b7-447d-9db7-1e2da4b567bc	registration form	registration form	1fe32191-f201-4478-b052-d3f2fd3c61d1	form-flow	f	t
1d34eff6-9603-45be-ba0b-adefffbc79e9	reset credentials	Reset credentials for a user if they forgot their password or something	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
4c5f54db-bf88-4331-a5dd-94c6b91fa702	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
368b0e28-04c3-4613-8674-ece6a59c8016	clients	Base authentication for clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	client-flow	t	t
1dc7fc4c-e077-4734-ab75-db10e695c17d	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
d1c2220d-2d9d-480b-9069-9ec6644a4232	User creation or linking	Flow for the existing/non-existing user alternatives	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
17dd3c6c-ed53-4a72-af8e-4765c4ca2fa5	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
64846ca5-a708-4107-8ed3-b26567450b3d	Account verification options	Method with which to verity the existing account	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
129ba7af-878d-40ad-b466-00e483796b95	Verify Existing Account by Re-authentication	Reauthentication of existing account	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
0a5e95a0-55b0-4ed2-8404-1fa81752da5a	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
506c2511-e627-4cdf-b0bc-fa81aa5d6d72	saml ecp	SAML ECP Profile Authentication Flow	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
d74bb65d-06ce-457a-9bf0-e1a8e74a9770	docker auth	Used by Docker clients to authenticate against the IDP	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
d56988f2-8108-439c-bcc1-f6f273b64acf	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	t	t
fd05a317-a127-491e-9671-6ef0e2040968	Authentication Options	Authentication options.	1fe32191-f201-4478-b052-d3f2fd3c61d1	basic-flow	f	t
c039d103-48d9-4fb4-b6f4-7259be670fc8	browser	browser based authentication	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
52b920c4-b4b2-42bb-a89f-7c8dde867d7c	forms	Username, password, otp and other auth forms.	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
3afca6c2-377e-49cd-a8c5-363117afa5fc	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
3aaf64b2-a83b-45c8-ab0f-12fb5f28ff30	direct grant	OpenID Connect Resource Owner Grant	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
379409f3-efd7-4a87-8c49-058d1c4ea21b	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
be211627-d131-4272-a4bb-a49e1c4ea75f	registration	registration flow	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
a5c07230-4bd0-45de-87e9-cdcb3415e159	registration form	registration form	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	form-flow	f	t
acccee70-52e7-4640-8142-f14355aa1c73	reset credentials	Reset credentials for a user if they forgot their password or something	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
dc71d962-3f7c-434f-a961-b1f3c675fec2	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
057030fc-ba4c-4ef5-b22b-e6e1932ed96e	clients	Base authentication for clients	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	client-flow	t	t
8687e160-9668-466c-bd37-7d6da786a424	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
838ad70d-6e0a-4e24-97f7-2836122003aa	User creation or linking	Flow for the existing/non-existing user alternatives	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
93543b13-c316-4755-8a76-f4d788ebc97a	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
583ddfd6-89f7-4c2e-9cdb-ca0d4ba9a82b	Account verification options	Method with which to verity the existing account	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
fe4bcddc-31e5-47ac-bff0-03be93746959	Verify Existing Account by Re-authentication	Reauthentication of existing account	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
d2da2d2e-d14a-4b9f-8577-ed6c9b025b3a	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
3c12877c-c252-4efe-b5b0-2f37146db6aa	saml ecp	SAML ECP Profile Authentication Flow	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
9828ce2e-62c3-47e4-bdc0-0bdc39fb0dee	docker auth	Used by Docker clients to authenticate against the IDP	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
b7a0f1e5-6106-4efd-8fb8-ea121126c7fb	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	t	t
842871f8-7cd4-4aef-a532-c709510369db	Authentication Options	Authentication options.	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
c08ec249-4304-48ac-8993-79cfdd711850	review profile config	1fe32191-f201-4478-b052-d3f2fd3c61d1
f221a1fe-4bef-4bc1-8dda-17097213557e	create unique user config	1fe32191-f201-4478-b052-d3f2fd3c61d1
bcd13c99-fe20-4017-a6ea-299612a7b9a3	review profile config	b1fffe98-6c87-4c74-9607-fb4b4c6f837d
e2d5af92-6b11-4f6c-95dd-f02f90cd9f4a	create unique user config	b1fffe98-6c87-4c74-9607-fb4b4c6f837d
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
c08ec249-4304-48ac-8993-79cfdd711850	missing	update.profile.on.first.login
f221a1fe-4bef-4bc1-8dda-17097213557e	false	require.password.update.after.registration
bcd13c99-fe20-4017-a6ea-299612a7b9a3	missing	update.profile.on.first.login
e2d5af92-6b11-4f6c-95dd-f02f90cd9f4a	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
898e4058-e58f-4e81-a344-ca38ee364ea3	t	f	master-realm	0	f	\N	\N	t	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
320cf5b2-3ee2-4217-960a-9bb316e187d8	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
2553be04-c600-4eb7-997f-40541b6d1711	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
71dfae22-f565-4171-a912-67857523e857	t	f	broker	0	f	\N	\N	t	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
7b552d29-8cb0-40ab-962a-cdb99cca67b9	t	f	admin-cli	0	t	\N	\N	f	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	f	Gamify-IT-realm	0	f	\N	\N	t	\N	f	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	0	f	f	Gamify-IT Realm	f	client-secret	\N	\N	\N	t	f	f	f
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	f	realm-management	0	f	\N	\N	t	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	f	account	0	t	\N	/realms/Gamify-IT/account/	f	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5811e4e5-a6f7-4aac-8def-8a53bd91600d	t	f	account-console	0	t	\N	/realms/Gamify-IT/account/	f	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
df8f2cb2-62da-4d73-88a8-7a540b093cc6	t	f	broker	0	f	\N	\N	t	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
740be63d-cd29-4660-892e-12ad842087d8	t	f	security-admin-console	0	t	\N	/admin/Gamify-IT/console/	f	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
8082411c-4141-4356-9a32-02ca2d393c64	t	f	admin-cli	0	t	\N	\N	f	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
8fb05d82-5c4d-40f3-9bb3-8439e9612224	t	t	game	0	t	\N	/	f		f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	-1	t	f	Client for the Gamify-IT game login	f	client-secret			\N	t	f	f	f
f043013d-a770-4400-ac31-9f97cf5beee1	t	t	fileserver	0	f	test-client-secret	\N	f	\N	f	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	openid-connect	-1	t	f		f	client-secret	\N		\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
320cf5b2-3ee2-4217-960a-9bb316e187d8	+	post.logout.redirect.uris
2553be04-c600-4eb7-997f-40541b6d1711	+	post.logout.redirect.uris
2553be04-c600-4eb7-997f-40541b6d1711	S256	pkce.code.challenge.method
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	+	post.logout.redirect.uris
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	S256	pkce.code.challenge.method
cb8e206d-aed8-4b85-9cea-9bc7406a935c	+	post.logout.redirect.uris
5811e4e5-a6f7-4aac-8def-8a53bd91600d	+	post.logout.redirect.uris
5811e4e5-a6f7-4aac-8def-8a53bd91600d	S256	pkce.code.challenge.method
740be63d-cd29-4660-892e-12ad842087d8	+	post.logout.redirect.uris
740be63d-cd29-4660-892e-12ad842087d8	S256	pkce.code.challenge.method
8fb05d82-5c4d-40f3-9bb3-8439e9612224	false	oauth2.device.authorization.grant.enabled
8fb05d82-5c4d-40f3-9bb3-8439e9612224	false	oidc.ciba.grant.enabled
8fb05d82-5c4d-40f3-9bb3-8439e9612224	true	backchannel.logout.session.required
8fb05d82-5c4d-40f3-9bb3-8439e9612224	false	backchannel.logout.revoke.offline.tokens
8fb05d82-5c4d-40f3-9bb3-8439e9612224	false	display.on.consent.screen
f043013d-a770-4400-ac31-9f97cf5beee1	false	oauth2.device.authorization.grant.enabled
f043013d-a770-4400-ac31-9f97cf5beee1	false	oidc.ciba.grant.enabled
f043013d-a770-4400-ac31-9f97cf5beee1	true	backchannel.logout.session.required
f043013d-a770-4400-ac31-9f97cf5beee1	false	backchannel.logout.revoke.offline.tokens
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
e79ac754-acf2-45e8-b4a8-ec03636fd103	offline_access	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect built-in scope: offline_access	openid-connect
f80e909e-cd80-4b47-acec-0bad5d5e2524	role_list	1fe32191-f201-4478-b052-d3f2fd3c61d1	SAML role list	saml
65aac617-7822-4a91-a893-146e621b39b1	profile	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect built-in scope: profile	openid-connect
826dff6a-bf4e-43e2-acf3-8a1412c44e4c	email	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect built-in scope: email	openid-connect
b0e7b27a-22db-493d-bb80-44296f9e576c	address	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect built-in scope: address	openid-connect
838a2442-5e92-4686-ba1c-f8280e80d2c0	phone	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect built-in scope: phone	openid-connect
b85c7c26-34f6-4981-b908-9b1187fb4bc6	roles	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect scope for add user roles to the access token	openid-connect
a3156264-b71f-4ab0-879a-c6c47c9012c1	web-origins	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f98aec00-5d24-4faf-adb3-27ae4dd2feea	microprofile-jwt	1fe32191-f201-4478-b052-d3f2fd3c61d1	Microprofile - JWT built-in scope	openid-connect
07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	acr	1fe32191-f201-4478-b052-d3f2fd3c61d1	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
889d6a9c-3645-4003-b641-718f8dd493c7	offline_access	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect built-in scope: offline_access	openid-connect
eeaae055-ca73-41c2-8eee-161f108c7e2c	role_list	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	SAML role list	saml
0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	profile	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect built-in scope: profile	openid-connect
035ff955-1590-4737-846e-8d279c463d6f	email	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect built-in scope: email	openid-connect
a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	address	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect built-in scope: address	openid-connect
1edf3b1e-fd4f-465b-8207-9242139b806f	phone	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect built-in scope: phone	openid-connect
752e8de6-366f-4545-8a08-b11d1ae514f2	roles	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect scope for add user roles to the access token	openid-connect
0e112aba-7593-4cb2-8e0b-c50683d92061	web-origins	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f90833df-a9ce-4f42-b567-bd91b38a9b37	microprofile-jwt	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	Microprofile - JWT built-in scope	openid-connect
def1ebe5-93f9-4f98-838e-4976aac26672	acr	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
e79ac754-acf2-45e8-b4a8-ec03636fd103	true	display.on.consent.screen
e79ac754-acf2-45e8-b4a8-ec03636fd103	${offlineAccessScopeConsentText}	consent.screen.text
f80e909e-cd80-4b47-acec-0bad5d5e2524	true	display.on.consent.screen
f80e909e-cd80-4b47-acec-0bad5d5e2524	${samlRoleListScopeConsentText}	consent.screen.text
65aac617-7822-4a91-a893-146e621b39b1	true	display.on.consent.screen
65aac617-7822-4a91-a893-146e621b39b1	${profileScopeConsentText}	consent.screen.text
65aac617-7822-4a91-a893-146e621b39b1	true	include.in.token.scope
826dff6a-bf4e-43e2-acf3-8a1412c44e4c	true	display.on.consent.screen
826dff6a-bf4e-43e2-acf3-8a1412c44e4c	${emailScopeConsentText}	consent.screen.text
826dff6a-bf4e-43e2-acf3-8a1412c44e4c	true	include.in.token.scope
b0e7b27a-22db-493d-bb80-44296f9e576c	true	display.on.consent.screen
b0e7b27a-22db-493d-bb80-44296f9e576c	${addressScopeConsentText}	consent.screen.text
b0e7b27a-22db-493d-bb80-44296f9e576c	true	include.in.token.scope
838a2442-5e92-4686-ba1c-f8280e80d2c0	true	display.on.consent.screen
838a2442-5e92-4686-ba1c-f8280e80d2c0	${phoneScopeConsentText}	consent.screen.text
838a2442-5e92-4686-ba1c-f8280e80d2c0	true	include.in.token.scope
b85c7c26-34f6-4981-b908-9b1187fb4bc6	true	display.on.consent.screen
b85c7c26-34f6-4981-b908-9b1187fb4bc6	${rolesScopeConsentText}	consent.screen.text
b85c7c26-34f6-4981-b908-9b1187fb4bc6	false	include.in.token.scope
a3156264-b71f-4ab0-879a-c6c47c9012c1	false	display.on.consent.screen
a3156264-b71f-4ab0-879a-c6c47c9012c1		consent.screen.text
a3156264-b71f-4ab0-879a-c6c47c9012c1	false	include.in.token.scope
f98aec00-5d24-4faf-adb3-27ae4dd2feea	false	display.on.consent.screen
f98aec00-5d24-4faf-adb3-27ae4dd2feea	true	include.in.token.scope
07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	false	display.on.consent.screen
07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	false	include.in.token.scope
889d6a9c-3645-4003-b641-718f8dd493c7	true	display.on.consent.screen
889d6a9c-3645-4003-b641-718f8dd493c7	${offlineAccessScopeConsentText}	consent.screen.text
eeaae055-ca73-41c2-8eee-161f108c7e2c	true	display.on.consent.screen
eeaae055-ca73-41c2-8eee-161f108c7e2c	${samlRoleListScopeConsentText}	consent.screen.text
0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	true	display.on.consent.screen
0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	${profileScopeConsentText}	consent.screen.text
0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	true	include.in.token.scope
035ff955-1590-4737-846e-8d279c463d6f	true	display.on.consent.screen
035ff955-1590-4737-846e-8d279c463d6f	${emailScopeConsentText}	consent.screen.text
035ff955-1590-4737-846e-8d279c463d6f	true	include.in.token.scope
a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	true	display.on.consent.screen
a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	${addressScopeConsentText}	consent.screen.text
a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	true	include.in.token.scope
1edf3b1e-fd4f-465b-8207-9242139b806f	true	display.on.consent.screen
1edf3b1e-fd4f-465b-8207-9242139b806f	${phoneScopeConsentText}	consent.screen.text
1edf3b1e-fd4f-465b-8207-9242139b806f	true	include.in.token.scope
752e8de6-366f-4545-8a08-b11d1ae514f2	true	display.on.consent.screen
752e8de6-366f-4545-8a08-b11d1ae514f2	${rolesScopeConsentText}	consent.screen.text
752e8de6-366f-4545-8a08-b11d1ae514f2	false	include.in.token.scope
0e112aba-7593-4cb2-8e0b-c50683d92061	false	display.on.consent.screen
0e112aba-7593-4cb2-8e0b-c50683d92061		consent.screen.text
0e112aba-7593-4cb2-8e0b-c50683d92061	false	include.in.token.scope
f90833df-a9ce-4f42-b567-bd91b38a9b37	false	display.on.consent.screen
f90833df-a9ce-4f42-b567-bd91b38a9b37	true	include.in.token.scope
def1ebe5-93f9-4f98-838e-4976aac26672	false	display.on.consent.screen
def1ebe5-93f9-4f98-838e-4976aac26672	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
320cf5b2-3ee2-4217-960a-9bb316e187d8	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
320cf5b2-3ee2-4217-960a-9bb316e187d8	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
320cf5b2-3ee2-4217-960a-9bb316e187d8	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
320cf5b2-3ee2-4217-960a-9bb316e187d8	65aac617-7822-4a91-a893-146e621b39b1	t
320cf5b2-3ee2-4217-960a-9bb316e187d8	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
320cf5b2-3ee2-4217-960a-9bb316e187d8	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
320cf5b2-3ee2-4217-960a-9bb316e187d8	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
320cf5b2-3ee2-4217-960a-9bb316e187d8	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
320cf5b2-3ee2-4217-960a-9bb316e187d8	b0e7b27a-22db-493d-bb80-44296f9e576c	f
2553be04-c600-4eb7-997f-40541b6d1711	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
2553be04-c600-4eb7-997f-40541b6d1711	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
2553be04-c600-4eb7-997f-40541b6d1711	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
2553be04-c600-4eb7-997f-40541b6d1711	65aac617-7822-4a91-a893-146e621b39b1	t
2553be04-c600-4eb7-997f-40541b6d1711	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
2553be04-c600-4eb7-997f-40541b6d1711	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
2553be04-c600-4eb7-997f-40541b6d1711	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
2553be04-c600-4eb7-997f-40541b6d1711	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
2553be04-c600-4eb7-997f-40541b6d1711	b0e7b27a-22db-493d-bb80-44296f9e576c	f
7b552d29-8cb0-40ab-962a-cdb99cca67b9	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
7b552d29-8cb0-40ab-962a-cdb99cca67b9	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
7b552d29-8cb0-40ab-962a-cdb99cca67b9	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
7b552d29-8cb0-40ab-962a-cdb99cca67b9	65aac617-7822-4a91-a893-146e621b39b1	t
7b552d29-8cb0-40ab-962a-cdb99cca67b9	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
7b552d29-8cb0-40ab-962a-cdb99cca67b9	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
7b552d29-8cb0-40ab-962a-cdb99cca67b9	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
7b552d29-8cb0-40ab-962a-cdb99cca67b9	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
7b552d29-8cb0-40ab-962a-cdb99cca67b9	b0e7b27a-22db-493d-bb80-44296f9e576c	f
71dfae22-f565-4171-a912-67857523e857	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
71dfae22-f565-4171-a912-67857523e857	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
71dfae22-f565-4171-a912-67857523e857	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
71dfae22-f565-4171-a912-67857523e857	65aac617-7822-4a91-a893-146e621b39b1	t
71dfae22-f565-4171-a912-67857523e857	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
71dfae22-f565-4171-a912-67857523e857	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
71dfae22-f565-4171-a912-67857523e857	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
71dfae22-f565-4171-a912-67857523e857	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
71dfae22-f565-4171-a912-67857523e857	b0e7b27a-22db-493d-bb80-44296f9e576c	f
898e4058-e58f-4e81-a344-ca38ee364ea3	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
898e4058-e58f-4e81-a344-ca38ee364ea3	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
898e4058-e58f-4e81-a344-ca38ee364ea3	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
898e4058-e58f-4e81-a344-ca38ee364ea3	65aac617-7822-4a91-a893-146e621b39b1	t
898e4058-e58f-4e81-a344-ca38ee364ea3	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
898e4058-e58f-4e81-a344-ca38ee364ea3	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
898e4058-e58f-4e81-a344-ca38ee364ea3	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
898e4058-e58f-4e81-a344-ca38ee364ea3	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
898e4058-e58f-4e81-a344-ca38ee364ea3	b0e7b27a-22db-493d-bb80-44296f9e576c	f
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	65aac617-7822-4a91-a893-146e621b39b1	t
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	b0e7b27a-22db-493d-bb80-44296f9e576c	f
cb8e206d-aed8-4b85-9cea-9bc7406a935c	035ff955-1590-4737-846e-8d279c463d6f	t
cb8e206d-aed8-4b85-9cea-9bc7406a935c	752e8de6-366f-4545-8a08-b11d1ae514f2	t
cb8e206d-aed8-4b85-9cea-9bc7406a935c	0e112aba-7593-4cb2-8e0b-c50683d92061	t
cb8e206d-aed8-4b85-9cea-9bc7406a935c	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
cb8e206d-aed8-4b85-9cea-9bc7406a935c	def1ebe5-93f9-4f98-838e-4976aac26672	t
cb8e206d-aed8-4b85-9cea-9bc7406a935c	889d6a9c-3645-4003-b641-718f8dd493c7	f
cb8e206d-aed8-4b85-9cea-9bc7406a935c	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
cb8e206d-aed8-4b85-9cea-9bc7406a935c	1edf3b1e-fd4f-465b-8207-9242139b806f	f
cb8e206d-aed8-4b85-9cea-9bc7406a935c	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
5811e4e5-a6f7-4aac-8def-8a53bd91600d	035ff955-1590-4737-846e-8d279c463d6f	t
5811e4e5-a6f7-4aac-8def-8a53bd91600d	752e8de6-366f-4545-8a08-b11d1ae514f2	t
5811e4e5-a6f7-4aac-8def-8a53bd91600d	0e112aba-7593-4cb2-8e0b-c50683d92061	t
5811e4e5-a6f7-4aac-8def-8a53bd91600d	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
5811e4e5-a6f7-4aac-8def-8a53bd91600d	def1ebe5-93f9-4f98-838e-4976aac26672	t
5811e4e5-a6f7-4aac-8def-8a53bd91600d	889d6a9c-3645-4003-b641-718f8dd493c7	f
5811e4e5-a6f7-4aac-8def-8a53bd91600d	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
5811e4e5-a6f7-4aac-8def-8a53bd91600d	1edf3b1e-fd4f-465b-8207-9242139b806f	f
5811e4e5-a6f7-4aac-8def-8a53bd91600d	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
8082411c-4141-4356-9a32-02ca2d393c64	035ff955-1590-4737-846e-8d279c463d6f	t
8082411c-4141-4356-9a32-02ca2d393c64	752e8de6-366f-4545-8a08-b11d1ae514f2	t
8082411c-4141-4356-9a32-02ca2d393c64	0e112aba-7593-4cb2-8e0b-c50683d92061	t
8082411c-4141-4356-9a32-02ca2d393c64	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
8082411c-4141-4356-9a32-02ca2d393c64	def1ebe5-93f9-4f98-838e-4976aac26672	t
8082411c-4141-4356-9a32-02ca2d393c64	889d6a9c-3645-4003-b641-718f8dd493c7	f
8082411c-4141-4356-9a32-02ca2d393c64	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
8082411c-4141-4356-9a32-02ca2d393c64	1edf3b1e-fd4f-465b-8207-9242139b806f	f
8082411c-4141-4356-9a32-02ca2d393c64	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
df8f2cb2-62da-4d73-88a8-7a540b093cc6	035ff955-1590-4737-846e-8d279c463d6f	t
df8f2cb2-62da-4d73-88a8-7a540b093cc6	752e8de6-366f-4545-8a08-b11d1ae514f2	t
df8f2cb2-62da-4d73-88a8-7a540b093cc6	0e112aba-7593-4cb2-8e0b-c50683d92061	t
df8f2cb2-62da-4d73-88a8-7a540b093cc6	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
df8f2cb2-62da-4d73-88a8-7a540b093cc6	def1ebe5-93f9-4f98-838e-4976aac26672	t
df8f2cb2-62da-4d73-88a8-7a540b093cc6	889d6a9c-3645-4003-b641-718f8dd493c7	f
df8f2cb2-62da-4d73-88a8-7a540b093cc6	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
df8f2cb2-62da-4d73-88a8-7a540b093cc6	1edf3b1e-fd4f-465b-8207-9242139b806f	f
df8f2cb2-62da-4d73-88a8-7a540b093cc6	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	035ff955-1590-4737-846e-8d279c463d6f	t
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	752e8de6-366f-4545-8a08-b11d1ae514f2	t
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	0e112aba-7593-4cb2-8e0b-c50683d92061	t
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	def1ebe5-93f9-4f98-838e-4976aac26672	t
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	889d6a9c-3645-4003-b641-718f8dd493c7	f
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	1edf3b1e-fd4f-465b-8207-9242139b806f	f
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
740be63d-cd29-4660-892e-12ad842087d8	035ff955-1590-4737-846e-8d279c463d6f	t
740be63d-cd29-4660-892e-12ad842087d8	752e8de6-366f-4545-8a08-b11d1ae514f2	t
740be63d-cd29-4660-892e-12ad842087d8	0e112aba-7593-4cb2-8e0b-c50683d92061	t
740be63d-cd29-4660-892e-12ad842087d8	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
740be63d-cd29-4660-892e-12ad842087d8	def1ebe5-93f9-4f98-838e-4976aac26672	t
740be63d-cd29-4660-892e-12ad842087d8	889d6a9c-3645-4003-b641-718f8dd493c7	f
740be63d-cd29-4660-892e-12ad842087d8	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
740be63d-cd29-4660-892e-12ad842087d8	1edf3b1e-fd4f-465b-8207-9242139b806f	f
740be63d-cd29-4660-892e-12ad842087d8	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
8fb05d82-5c4d-40f3-9bb3-8439e9612224	035ff955-1590-4737-846e-8d279c463d6f	t
8fb05d82-5c4d-40f3-9bb3-8439e9612224	0e112aba-7593-4cb2-8e0b-c50683d92061	t
8fb05d82-5c4d-40f3-9bb3-8439e9612224	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
8fb05d82-5c4d-40f3-9bb3-8439e9612224	def1ebe5-93f9-4f98-838e-4976aac26672	t
8fb05d82-5c4d-40f3-9bb3-8439e9612224	889d6a9c-3645-4003-b641-718f8dd493c7	f
8fb05d82-5c4d-40f3-9bb3-8439e9612224	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
8fb05d82-5c4d-40f3-9bb3-8439e9612224	1edf3b1e-fd4f-465b-8207-9242139b806f	f
8fb05d82-5c4d-40f3-9bb3-8439e9612224	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
8fb05d82-5c4d-40f3-9bb3-8439e9612224	752e8de6-366f-4545-8a08-b11d1ae514f2	t
f043013d-a770-4400-ac31-9f97cf5beee1	035ff955-1590-4737-846e-8d279c463d6f	t
f043013d-a770-4400-ac31-9f97cf5beee1	752e8de6-366f-4545-8a08-b11d1ae514f2	t
f043013d-a770-4400-ac31-9f97cf5beee1	0e112aba-7593-4cb2-8e0b-c50683d92061	t
f043013d-a770-4400-ac31-9f97cf5beee1	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
f043013d-a770-4400-ac31-9f97cf5beee1	def1ebe5-93f9-4f98-838e-4976aac26672	t
f043013d-a770-4400-ac31-9f97cf5beee1	889d6a9c-3645-4003-b641-718f8dd493c7	f
f043013d-a770-4400-ac31-9f97cf5beee1	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
f043013d-a770-4400-ac31-9f97cf5beee1	1edf3b1e-fd4f-465b-8207-9242139b806f	f
f043013d-a770-4400-ac31-9f97cf5beee1	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
e79ac754-acf2-45e8-b4a8-ec03636fd103	790ad0b9-0a10-43f6-af7b-e0778d6a965a
889d6a9c-3645-4003-b641-718f8dd493c7	7c446627-c000-48a7-917d-4ab618270cbc
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
ef9330e7-4376-4dcf-a6aa-8b59e3a6b0cf	Trusted Hosts	1fe32191-f201-4478-b052-d3f2fd3c61d1	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	anonymous
8ab14419-9552-4597-9a8a-4fdd113bbbb3	Consent Required	1fe32191-f201-4478-b052-d3f2fd3c61d1	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	anonymous
699f73c5-0a0a-4848-8d07-441f4f53db0f	Full Scope Disabled	1fe32191-f201-4478-b052-d3f2fd3c61d1	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	anonymous
af7927d2-fcf0-41cf-b117-795226c9ecb0	Max Clients Limit	1fe32191-f201-4478-b052-d3f2fd3c61d1	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	anonymous
d3fa2d7c-fb03-46d5-9d59-5a9618963641	Allowed Protocol Mapper Types	1fe32191-f201-4478-b052-d3f2fd3c61d1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	anonymous
14f36d56-1c04-478b-99c7-c4299c9b88ac	Allowed Client Scopes	1fe32191-f201-4478-b052-d3f2fd3c61d1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	anonymous
3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	Allowed Protocol Mapper Types	1fe32191-f201-4478-b052-d3f2fd3c61d1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	authenticated
b92d1074-1020-4385-baa1-aa0732531be8	Allowed Client Scopes	1fe32191-f201-4478-b052-d3f2fd3c61d1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	authenticated
485340af-c868-4615-993a-a07ca327e9fe	rsa-generated	1fe32191-f201-4478-b052-d3f2fd3c61d1	rsa-generated	org.keycloak.keys.KeyProvider	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N
19266a82-a340-44a6-8010-915282f19d97	rsa-enc-generated	1fe32191-f201-4478-b052-d3f2fd3c61d1	rsa-enc-generated	org.keycloak.keys.KeyProvider	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N
144c7497-a39b-46d8-8847-cd6f1aeac0a9	hmac-generated	1fe32191-f201-4478-b052-d3f2fd3c61d1	hmac-generated	org.keycloak.keys.KeyProvider	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N
80ed99e3-3a07-4150-b8ee-71f000ed5902	aes-generated	1fe32191-f201-4478-b052-d3f2fd3c61d1	aes-generated	org.keycloak.keys.KeyProvider	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N
1b59c659-be84-4680-be76-89589f566804	rsa-generated	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	rsa-generated	org.keycloak.keys.KeyProvider	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N
d533731c-5e7f-4d84-8d5a-6c6bcb399e6b	rsa-enc-generated	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	rsa-enc-generated	org.keycloak.keys.KeyProvider	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N
346742b7-3ad1-4e7b-9207-99b7a47bd550	hmac-generated	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	hmac-generated	org.keycloak.keys.KeyProvider	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N
ac084138-b998-4f7d-b0ef-c54b6da0e705	aes-generated	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	aes-generated	org.keycloak.keys.KeyProvider	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N
04602d6c-153d-4a60-b2df-f5518544ccc7	Trusted Hosts	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	anonymous
5fa5a9e6-f413-480d-be0d-0074e7c3f239	Consent Required	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	anonymous
5a4309d9-1bcf-46cb-ba0b-e6ed085356c9	Full Scope Disabled	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	anonymous
1dc89aad-7148-4d4b-a8ed-02fb7e42382c	Max Clients Limit	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	anonymous
69ef2ab4-977d-4452-918e-8c91e0b2ab23	Allowed Protocol Mapper Types	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	anonymous
d9faaa94-fd77-45ed-80ec-17ad4625ea41	Allowed Client Scopes	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	anonymous
dce12884-91e3-4118-8b60-99166c3e707a	Allowed Protocol Mapper Types	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	authenticated
9ed397b8-79b2-43a2-b64f-de4c5bae1e99	Allowed Client Scopes	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
7be53205-256c-4ed2-8268-44a8d9cb7f4b	ef9330e7-4376-4dcf-a6aa-8b59e3a6b0cf	host-sending-registration-request-must-match	true
abc93b6d-a490-4121-83f2-1cf365fc0c9a	ef9330e7-4376-4dcf-a6aa-8b59e3a6b0cf	client-uris-must-match	true
56f62739-3d7a-42f9-8e13-63037c9f43d4	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	saml-user-attribute-mapper
de716380-7799-4f27-aac1-81493dc1c48a	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1c3f8848-60d5-4f7d-80af-a6b12c5995f1	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	oidc-full-name-mapper
51f46d54-f7f5-432a-8af2-a4461aa28b49	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	saml-role-list-mapper
e807140b-cf44-4ca9-b728-f331f4e66569	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e464c6ec-46b3-4ee5-b69c-697b7ccd1261	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	saml-user-property-mapper
6f2d17c1-7e26-4972-a164-b5c3daf6e63b	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c62a1a20-f98a-4197-86c4-55578cecadb0	d3fa2d7c-fb03-46d5-9d59-5a9618963641	allowed-protocol-mapper-types	oidc-address-mapper
ac9ba051-9e6c-4f62-a57a-514d54dae6e0	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	saml-user-attribute-mapper
28913dce-4d1a-4485-ab8b-b13e49b80240	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	saml-user-property-mapper
a6d33779-e2f2-41a3-b20c-9d73fa67d4f3	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	oidc-full-name-mapper
a19b96f4-701f-42a8-9586-25a82b41dfd6	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b0849c50-af9f-49a6-bbda-d9cd0bb455a5	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d734e964-1451-4284-979e-cd55f9716120	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	oidc-address-mapper
943ed410-415c-4d0e-922c-bd3c2d8fa97a	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
124a5796-3996-49f0-a4b2-88a15f1505d5	3f7ced3d-ef2a-4dad-b073-a1950c7a6c33	allowed-protocol-mapper-types	saml-role-list-mapper
6d2cd4d6-ca67-4509-85f9-227d0f55633e	af7927d2-fcf0-41cf-b117-795226c9ecb0	max-clients	200
2bd1396a-66cf-4850-acff-2ebadf38bfed	14f36d56-1c04-478b-99c7-c4299c9b88ac	allow-default-scopes	true
c1586e8c-5ca6-4ae6-aed3-5f56dc38522f	b92d1074-1020-4385-baa1-aa0732531be8	allow-default-scopes	true
5c7e02c0-b2e9-4a13-8071-1de4e7e57801	144c7497-a39b-46d8-8847-cd6f1aeac0a9	priority	100
93fd0991-3c00-4884-9143-0fc54b89bc52	144c7497-a39b-46d8-8847-cd6f1aeac0a9	kid	25c94ef7-e7cc-43fa-8d9b-b262322ebc7e
68c60e0d-4e77-4ef6-bd97-e10a86af557e	144c7497-a39b-46d8-8847-cd6f1aeac0a9	secret	VZm4DX9lPrx6dVyK8TINnJryvW93vGl5e_Jnk4wQgQ-Gky0VzmWScFCwi2u-psww8TTVNK4HgzrgmhRJJ2ivqA
597060a0-af5c-48ff-9533-028ac4237aa5	144c7497-a39b-46d8-8847-cd6f1aeac0a9	algorithm	HS256
36a109e8-675e-48c1-be1a-cbee814193dd	19266a82-a340-44a6-8010-915282f19d97	certificate	MIICmzCCAYMCBgGC34sTVjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwODI3MTM0MTQ5WhcNMzIwODI3MTM0MzI5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC4Jiw3T4LB6c5ksOmG+TjArbM5I7fcQ5+SigSrGkIQb7uz2ellhNelCzHUKTw9XSYMI0k1yJjdTeS7VM6KI19x1PhfidxoZm7OSk7XJS9oBtNPl7IhB92lmMCx+JRr5BI/AmH81OAU+fD1bLuuV86eis68AwlQZ+lsssSSf3+xN4S3pIsw6tXD+hdcyxvnD09Y12Vk/jtXTChk1P+9Z8PKT0Wn1IXqhczWn0YL3y9OSNjQEKZOxyFAZZ4JM1Yb6QkYoH6voJlvJ9a7fN++xgATJigBqoZu1XChgY4/eef3RKIw5LRSzPGUuLsjrbNYEQXRj1iD8UfShOZ2c/vhFrCRAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKZGqScWfoqgnDwjbHlwTXGAwAAQRZ+Xd8LYzOZ0UQawNuDoBcyNpHhpwRZXgPGhwiBdV8IAlXpTlT26HHYd18uUqWP4oQU9BO+MqrtWTdETKB5zFiyAYQdHlLdnkNtMvXi3IBbmEUkfjU9Uunouhf2qBEBcUWv1omRAA4hms0zgy8ULsza1I4AaFPf4krdDU3sGN+heDM5wQO2/w1xqHpsPx1WvcqTaNkJVbHgffDDM/G1wq35mSaMbWHfBeh9OPUy4ndck29NkbhJSd7FouudMWOtZ7k5lJKMyFx63sJBbqieqKKog3qWP9O5wizv0jIoneld0mq1o8D8i57Tj3is=
b6ecae2d-8c37-489f-8ff3-dd2d481a346c	19266a82-a340-44a6-8010-915282f19d97	algorithm	RSA-OAEP
ed2c6d97-541b-4bc7-a4f2-d20d6ba1e3dd	19266a82-a340-44a6-8010-915282f19d97	priority	100
d5037307-0cbb-47aa-8d1d-433bad79f6c0	19266a82-a340-44a6-8010-915282f19d97	privateKey	MIIEpAIBAAKCAQEAuCYsN0+CwenOZLDphvk4wK2zOSO33EOfkooEqxpCEG+7s9npZYTXpQsx1Ck8PV0mDCNJNciY3U3ku1TOiiNfcdT4X4ncaGZuzkpO1yUvaAbTT5eyIQfdpZjAsfiUa+QSPwJh/NTgFPnw9Wy7rlfOnorOvAMJUGfpbLLEkn9/sTeEt6SLMOrVw/oXXMsb5w9PWNdlZP47V0woZNT/vWfDyk9Fp9SF6oXM1p9GC98vTkjY0BCmTschQGWeCTNWG+kJGKB+r6CZbyfWu3zfvsYAEyYoAaqGbtVwoYGOP3nn90SiMOS0UszxlLi7I62zWBEF0Y9Yg/FH0oTmdnP74RawkQIDAQABAoIBABV06zOBqfp2yAP/AiLmQKjgxHCMuyRo47vDJbKbI2X/YudcpX+c+DSEpqhyKpD63M9OwD3KUxd8N0HlqpA5eWpN1qfpLBulDdWvHlseu9Sa8P3F7u0+2aJtN0y1anPc1gxt9mVrl3WSPvOV2ROCKzLZeSe6kdgC15XBCbsJLKOFIhAKUyOxpitnnoKdNYKAodWXGK4oI7a0hDlSGpUtGAKpSJ62bMdIjX5J4H6RC0dTU2m+V8n5qZxRuDGi/50LZU8P4V0J4bg+qWc+iAa5ktq3sY5qavuIRkssFjq128rSFrccVrvqIWT5ZBwP6UHshfH+6Rq5ljqKif+/4LfKQN0CgYEA6YDig9m1shkQZ8myTrtX8VbBx6/vH99uqH8b84GD12UzUDS+n8raaA88NINThzDSCK/x0AV1IGaAJAVmNg3J18i/T06rMRxSVXrqf1JZyRMLz6t8mrbfXSKrpXfbbH++qtJlajKJan1GDAivbRb12j+jYElopdhnAxzDULhgrgUCgYEAyeQD7E179sj/5gbqgA7J1hFoSUr+gBaYWYaewnROSi/65xwSWqFlwSB7cIbCUsIZNqhBDCqDW0q+smp60rJF9+lUr+wK8lSdYVcaMPpgx8g5g3QgNnZ0We6K5uab/jbM3FETympBqCBUqyaxSroaS2i5p5kf4RLoSi0urd5uMh0CgYEAuOQR+B8KLPSFtfjSVF8penKcy/Y2HQG5SHgldMHn2EVMxUSOcE6ac+0kWdxm5lQ06yYODg5UOQyQiHUyArkWSuOtAColiaSIWSETzy8w4vNO1ehOqN8GrGOIkGQAfcAFBJPGM7nCb2y0a1DxPysADwl23wYhc7iPkLpUuXTVMNUCgYEAsWKEB+V0m7qzDHrbIzTbJhkZVfxsbEJuDYr4hsYF260YeGLzxWm1q+BMVOwyZOBhouJmdLgNvfKIZt6jl+hHDbGXVRLB83Vg6hvLyWjUC/Tig5tOiku9ox6yMHpCaTPg/1rFVr3RflUZz18puwyU+djD9nvVxL4GFtZoAyBCFgkCgYBjDQBA98akLORh55GDZNPr9xk2Igm0GqyTA7+vYOSmUTVRZTHJWuPrDn+z51xk/o+71kXiYsHzfkv/L86PQTt5MvPZQJXKYqNPFtY8xSKmw1DBjVTJTcfWV1Yf1KFWChW38PL9UhYG7hZUSwE0G5NxPhMzcqMZIUVpn/bcQ3qIFg==
89c8e5c0-1131-4436-8ebc-dc0a44f82ad5	19266a82-a340-44a6-8010-915282f19d97	keyUse	ENC
a6b7a33d-3874-4afb-9474-5ef35d122c44	80ed99e3-3a07-4150-b8ee-71f000ed5902	priority	100
b6eeb0df-7537-4f7e-8bfa-a313f20f0818	80ed99e3-3a07-4150-b8ee-71f000ed5902	secret	jTWYNxhHcPlWgmuPoPoOmg
faceeb15-f7d7-400e-b3e4-07257c15b42a	80ed99e3-3a07-4150-b8ee-71f000ed5902	kid	15d5c3db-e508-4057-9493-29871a8a59ec
bc0b7a6c-c404-46f5-8c83-db9969410e47	485340af-c868-4615-993a-a07ca327e9fe	certificate	MIICmzCCAYMCBgGC34sRqzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwODI3MTM0MTQ5WhcNMzIwODI3MTM0MzI5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC71ge8hvH7am8WKTV22uvH22QcVw/PkQbxDZg62t0N+C0qeWaNrIVdLR0ZWKftqx+syL2cSCHfNWFDrVZoOWM05GPhvV6iz5rgki30s6Wq0uwsSbY8z5NcB0wjPJAvK0p7o8CO39hLHmEAlKXnhVgNZqADq2kQULPNnm5co6uKzI2tBP/ouqpmo1yEXHGW7znGZ60uddYZLfEvduq5EOhosOTnT8igX9SdBbEOK49rlsjxXghp1URtRI2GqpI+8L6Hozw9Dvqj5iHi86G7BZQNH6AwnqjuJC42OATlwGFwPRKcSEgjTBlN3d6ODTWcYWcVy3FKAFKQv+E9JyWKZ8ihAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAB/AdAP53ynoYfVQijM5FnvM5Xxi6U7xLf3+HYmtf3C3SpB+/Pa/2rP6p6QmoNIe5yitlmfC8l8HQeEBrqvuvSnVcvq1EWHohPxw7rxv8iiHABTrixKctF3s4F7UKgFuiaS/Mky2HEL1TisWxBtkBDzDARCKRu/4VcqwTZUjQnvVJC4MFQrVquoSCKupgMpVWEtnW0SHs/q7CD3tDY8P4sohH5S0otdyf+BCN0wYkKSC7DIgzcaFMFf5ubnOx62uhwm39s6sS5eizfuPbbhzXh39YLOdRmkdv3ku/4h2GPJZgRgkUB9nM4ei+/C924NyNvd4MZwdPx00Z8EDs4Cr7N4=
22a65f93-d65f-4fba-b214-83f1149f3456	485340af-c868-4615-993a-a07ca327e9fe	keyUse	SIG
189a103b-1b80-44d7-a815-a5e0a88b6108	485340af-c868-4615-993a-a07ca327e9fe	priority	100
ef7d85c4-3c6d-4c83-8777-4492f08d8eee	485340af-c868-4615-993a-a07ca327e9fe	privateKey	MIIEowIBAAKCAQEAu9YHvIbx+2pvFik1dtrrx9tkHFcPz5EG8Q2YOtrdDfgtKnlmjayFXS0dGVin7asfrMi9nEgh3zVhQ61WaDljNORj4b1eos+a4JIt9LOlqtLsLEm2PM+TXAdMIzyQLytKe6PAjt/YSx5hAJSl54VYDWagA6tpEFCzzZ5uXKOrisyNrQT/6LqqZqNchFxxlu85xmetLnXWGS3xL3bquRDoaLDk50/IoF/UnQWxDiuPa5bI8V4IadVEbUSNhqqSPvC+h6M8PQ76o+Yh4vOhuwWUDR+gMJ6o7iQuNjgE5cBhcD0SnEhII0wZTd3ejg01nGFnFctxSgBSkL/hPSclimfIoQIDAQABAoIBACfUL+rFcH0fqfN4hHox3IoR1q39tgAM3/xwJgXgz7u9EpKtkFXdLaA+xytPNbh7Lym7nR0M3IXQc1He6PILrSIThaxhs7XxMIWK6Yy4JRpORD712FsXpsb+UyIrnuUpmE8UP2nsRBhVljsByhYIG84noyl0CMCpZB7nB77EA8VX0ZwCyIenWjhPwksQvHQtFhcfyaioczyOnhTUxA1C3ZwDV4FiD/UrT+Akl193BZrbUcGE4tBteO0WbzG71FbEQNemRf/oPkHsJuapBT7JUvBzR5A40N8bAM3fV3TT30MOMxOAXP4FGMLvp9I1CQ1XKr9t+eBo5igJDOlONnG9kFkCgYEA+1RG/CXgACZbuc2aXpPcZBnbeW/0pB5Alzu67ggI+ofHTVQoPAoYqOfQvrGHfAfd/zHt0VuKcs5MIeKDYP95at9v379e29Iew4NuCL4qmIeT3O2KDQrwUZgl8sUvGKfS6eorIB9EC9LoG4SXmkJl75bAzrPIrYyUcsbf/T+or0UCgYEAv1OtnlJ0f95UuPFzItQuDFGXfVJ+uohMrqN2tFbImNrAUUXPElp5vPAQv1UI3FaBaOXKRgukuG2MB65Nmcf/lRfrCxmDrwhDY15yFNLE78EU3hWUo7MpGuUfBkm8AyPjrTggChnJPOzh8cHm87lBn/66lhbxzlHEo2QMFTxB660CgYEAt0VXlhtQYwuVq8IAJaOQ/PXWE5HORbdBxoZp45W8ZmSIsx0BUfbS0KhqkgQHFizud19DWn10Ug+ZeMQipaLmOUbB39k/JPDuOggnPvzdNuj2rA4Tszscz4MxePzNQR9wL97wn7Xs+upLE3X2zyhICRRXeOOlHNj8j03ynEvFiDkCgYABQhyfMO2hNaYa/UODlB+lZxf29AbvVRwj/eE2+GcjUjT3k9zzwvKQAogpqfZ/9HWvaet1oHf52oaUOlo6S61rnpemIAnUqdo/mgxoBKbU6NEpUL0EgpYfnighE3UQFDlYF0lmp5rCMtCdlWfebHZ5BeTWPdpjP/hqFqtZrGbGlQKBgENVPisLycGT3Jz39kWPue+RIWyEd29gpEcwFIWZHdlA1yTHVjhZca6QrJZHLyUJ8aOzOHAbAYhUmjCu1EUnZzKA7mwOQkRdQJEwnACbQh+CuP7z4Mb1YjZKFGCOkFVU2nPr4Ut0ahlA2eyCdC4rivAlTVV1hbL3S3BCE1z02BHa
04651f43-177b-4f85-99bd-2ed5e99e5a9e	ac084138-b998-4f7d-b0ef-c54b6da0e705	secret	SpdVePqoBQ5B2Wu_Zc2d5w
3a60d9cf-f48e-4cf1-9e0b-8b7f352cf663	ac084138-b998-4f7d-b0ef-c54b6da0e705	priority	100
f029286c-755c-436d-8693-2893e6288fce	ac084138-b998-4f7d-b0ef-c54b6da0e705	kid	c2e9a5bb-a2c5-41e7-b162-f1c3a2c6e582
0b499dba-824d-47f8-9786-717a07bc2431	1b59c659-be84-4680-be76-89589f566804	priority	100
473bf6a8-3997-4d4f-b993-65f322fa30c0	1b59c659-be84-4680-be76-89589f566804	certificate	MIICoTCCAYkCBgGC34v+NjANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlHYW1pZnktSVQwHhcNMjIwODI3MTM0MjUwWhcNMzIwODI3MTM0NDMwWjAUMRIwEAYDVQQDDAlHYW1pZnktSVQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+SJRu1Fwhk3jXpSlQmkUQv3qeQeF1xp1SAzDPbbiAXMNiJt6N3pRCAKSnGQKROHQ+qq6+It+ocvYDwzOFSvJcv4nMaEfYkQroISpzghJxgAFcSxxo7fxbt7zHxyEMVoLWlG8Wt426xE/wBqDUZqKUSgO/Qnucoz5j3PSn6rkSuWxv4raKyr/Q+dT7cHMwo+sJIiVcVaDChsVAxS9CTADI1IB6/1lVogXoD2RspxAaWGb+KJjpzT5Y/FQRfpJ53URLk2n3N90ZBG28xP6hHxRO2fKdzqE9tytXuXOkrI3xBcasH7AEom4vxiNKzJkMDmP3HkgnBjkpIy90bInrNLJxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHFVjF+eDMkffvP234hLK3lyAfW/H1sq8l/qg7D/RxoyyY1PDOkNINq/6RyH6IGG43aT3XmwBZuIb4fSh26pjmbmws1C4h5ALY00YI7uaIaoGpYnMJDmNvaZO8/UYy/IAPIphc7ngWYAbOe7K1Fpe/UM6VlQd33uNiVJTjrZAfP8f/nZW73uCpQcinkxjSF3YDyvrfStkM1/zxdM/bMMMr8wPKEDp0KMrPHgWUdeSlIzVZF6lvjGb4GMIM0S5zCpO/5krlvHr4YTozgDqpWmbr5ZKwqXVoJTuoD7dTOOYF9T61RUFxYp2oV+xaDWQyv8lTK+cDArPlLLjCMJvOYYYQM=
195a395a-01b0-4ad1-8a2d-0e0b0629791d	1b59c659-be84-4680-be76-89589f566804	keyUse	SIG
e8e4d73f-9d83-4c99-9347-068afe0ab982	1b59c659-be84-4680-be76-89589f566804	privateKey	MIIEowIBAAKCAQEAvkiUbtRcIZN416UpUJpFEL96nkHhdcadUgMwz224gFzDYibejd6UQgCkpxkCkTh0PqquviLfqHL2A8MzhUryXL+JzGhH2JEK6CEqc4IScYABXEscaO38W7e8x8chDFaC1pRvFreNusRP8Aag1GailEoDv0J7nKM+Y9z0p+q5Erlsb+K2isq/0PnU+3BzMKPrCSIlXFWgwobFQMUvQkwAyNSAev9ZVaIF6A9kbKcQGlhm/iiY6c0+WPxUEX6Sed1ES5Np9zfdGQRtvMT+oR8UTtnync6hPbcrV7lzpKyN8QXGrB+wBKJuL8YjSsyZDA5j9x5IJwY5KSMvdGyJ6zSycQIDAQABAoIBAAqfTZ30P+Jl86CCKVDFE+bv8X3lKptjB4Q9BlwGAX807nlLty/PRZJ7q7ViSYjm0GJxL8kQdFDYfhBOtNETkn0H+j7NcXlO+39i3pZNJA9u+GR5EvBunKBYHPNAFAG20J3+8kaf34sWC2pYTGEfC6NgkF38bZ8cY866VnQLP+KiG52xofEsZPlOzClVERoQi9dfZ05SN81hxUt15Pev2N9epm7/y9dd8V43nN9ZfBkecIrh4rbpTKlhy7qApV/mvCPbN6ZtMRLX2Fhftvd+nuAr+a0dKTz94jecpdu1q+wCwEXE52q8e7I2VIJF/vlSIbXVmrgwzUIYebueEJKvprsCgYEA3aF2OY9YBCBsRT/1Z63Og2sCyv56sbVOxuJ/ihZlSnMBXole+sfKFxYSeVrezzBfpswV0msRoJfEf/MTnVFi2Hww5Um6GZCFvmVV54AEQX3yDU8cwkkmaIHGxsE4ES7L6fDJloeCVgjrGCgleVoLowjip5qlNIFdi2WPpxNStgcCgYEA28qpq8X/3EiNdWm8KRDe25r03cMbIFdi1yGyP/u8sE1kKuPcRz3F99XxXcJxEdBts3kIM9f72Oe07zZ/Zg7TNxz++tGb4zqelHTIqxMji1oipkofdeniyn+KGesCmGuw5zn6Gw2p6bXYgks8x+z90XtZOO5gSXtkY5ILFzOIdccCgYEAoIMXhIh0TkjNITo5GWWfcz5FP48efSW6cAAKLpAZu9me3EDRMP8RNbcemhVd2OBH5h1YkJRKp+xCvAfn5L/UvsTzBJxo06r/seziUk88xdHZRBpP0cX4syeKNtgpKwihVkS1OvfZRUYgPdaVjVXRp7n/rTMrAuPOQ+7CI1azSHECgYA0pzRGZkSJLQhWXGIrJFN/IHwQtDDHaqfPCc997Hyjb6bTb4rRtka6vJH5+B7GObxOBmykntVCfR+nPtL+TAblaRjcVWKW6PAceG2qLgeR1qH+XDt1L/aYtD0NQHN6uDHE8uqrmHZf+qRHcma5LlkP2hDhxpligSDniZEGmd3S+QKBgCTXu2pMsh7zfLsMBIQY6D6kKFUKSzJGoikTTR6Odc2d6IsV2Ly2uDfFuNk+NKfty4AerIcfDRDMgkVDEDFklMKd4aSM6a5NV4/YmZ56Dsv/aqPDEyoKRD1aXc0U4wksBtT1g7mT3V71/iCl/0mk2lkhA3AJ4hLT5ywza5zO1met
6df51972-c25e-4107-bf45-5df9db31c556	d533731c-5e7f-4d84-8d5a-6c6bcb399e6b	priority	100
416de241-c690-4269-808b-a24ef0aa51c9	d533731c-5e7f-4d84-8d5a-6c6bcb399e6b	algorithm	RSA-OAEP
77042457-6e91-4ae7-aab0-9ec675b07baa	d533731c-5e7f-4d84-8d5a-6c6bcb399e6b	privateKey	MIIEowIBAAKCAQEAtYqzTQWKisZFzcNUlzQ5z4JIIkpYKXSB1aDF9s/uiPTRS4+xn5QQqgQn+AmI5stdnmUR/659DfEHMmUJ9gIdQff1qLY/Qs2oWWHi6P0Bfg7y9NAQfiuUdhBNg/8uTYi8dAUrNcGFN9C87VeSNs/YP67Rf393/KT1kbmmXo9xX8kSz0zvIC/VlHx40PwWCwq3NdxsiIRV75cJU+G2JjVzAJuKn338aLnzTdHVA3/T/gxH9kNEg5YeUE91dMWk/u+ab2x/L6qLWTzT3e9wM7bfTYBYqDY2Ao6sRjMH0sF4ZdJlSg/Q6JhdncKfQY/yYhZrX/4/LnaMebetcoV0y7QJmQIDAQABAoIBABJiXSV53+2NRiDf/MdCJ++ScTUdw79Q99v3J80GghC3ACHvh4ySPTzGZnjJGGbM5epmMFQs6qeYhsLM9h0GWkmlr2g6Kn5cnsWMcuLmyjmmkGaH0n/AcIyjOoJZO2ppJDJ4modbVV8RYayEX39y/WJ3lOodMbyxRNgQzZ8KVjAdnBC2V5PpJV0W300NU5CWcFI7JdkXp20R2yau/szwXnmubr2AdVbGHW5ys8gAZLFMr2aQNuvSTmuOzeiLQEv/eOm2eSd4YexPDPXx1lAfZj2kXUt8QwvT4ipw/6w3iG/drntGzDFYaXhrmNhI5/664SUOYfhAWWF21/BOgzH4Bk0CgYEA7Qg8/y+8aNC3NPMxIDiNy7DKBgvCxyQQm8cbjUelANGUnAk3kSvepJZAd3ehZjvWg4d3DyQFxtBNYWDc0kR32s11IAnQBRDu8JetATeeJorpp7F27atY1MPpLQ+DKm0l3YJdwOP1U4sHdSYkf0S5djybe798tGYXKCHWNevyNWUCgYEAxBG0a8moMSGcHKF9Dq+WvRI9r5pe2TkK45nw7Z0vmhhjYpQvOSuno/r/gv4z0nS2NT/g86cqf988hxHtKzSZXlMs7QgS4kqK4XipvdvP9XaCP/0yRIwipG9t9tXnonDTFw+6zPGRbZ4VXfkjSbODhCaE0BSO1lGzqCGZLA0U6iUCgYAFQGV5kekuuVEVzz2LZTVfCe+v6prKJrZnfSXTH388YWhVfK7KfJpWMy4Cd5gP18uM5ndw0m9+VCcivS6nSfUN1/d8WjtNoW5pzjJ7EGxkljdPC9OCuIUjUaPc57cUPY7VNYo2N9a7nxzvL4UnfLJPOFCJkViF9q0UqotAbpXTMQKBgQCz8+P6Ae2Cmmxjwru63OGmyrUfFLn0+OvLlaCRFXF5JuUgtwzYlf6Y/GfC3HjHsiMBoI1gU48oKcWt2oAo5W/WKNTVAFIEq5Hn+w0fmj219nz5KfQXAd9RuIvevtiIOLElO2ShcR2e1DacN2tx23bbtVa0fAnVHsubhqrEyYTmmQKBgH4FpzTEe0dC1hWoTgaBKX3LWuJ4ZhiZfizx6pb/NWerJEKfZtsABzu89PgAkh9dbN665XaYZe4DOkraB7zMOv30jBdsMDcd3dziNTRT8SyfL4jFfy9Py5DMQE3boy6yxvpNFwPvGjRk2QYODmwz6gPXuNBZxqqNjTJI4SWCSXws
34f37483-fc22-49d3-a2c8-bc5a8a48557c	d533731c-5e7f-4d84-8d5a-6c6bcb399e6b	certificate	MIICoTCCAYkCBgGC34v+fDANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlHYW1pZnktSVQwHhcNMjIwODI3MTM0MjUwWhcNMzIwODI3MTM0NDMwWjAUMRIwEAYDVQQDDAlHYW1pZnktSVQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC1irNNBYqKxkXNw1SXNDnPgkgiSlgpdIHVoMX2z+6I9NFLj7GflBCqBCf4CYjmy12eZRH/rn0N8QcyZQn2Ah1B9/Wotj9CzahZYeLo/QF+DvL00BB+K5R2EE2D/y5NiLx0BSs1wYU30LztV5I2z9g/rtF/f3f8pPWRuaZej3FfyRLPTO8gL9WUfHjQ/BYLCrc13GyIhFXvlwlT4bYmNXMAm4qfffxoufNN0dUDf9P+DEf2Q0SDlh5QT3V0xaT+75pvbH8vqotZPNPd73Aztt9NgFioNjYCjqxGMwfSwXhl0mVKD9DomF2dwp9Bj/JiFmtf/j8udox5t61yhXTLtAmZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAGPVi8oA2ccOcgRTiCvSaGzsB032D8f/HBBb1tkMvgpuJblQh21zQoiFOle9tVUIAHCYjLaSbnmzryjxytbrgNqmuTBQze8YOxFzGCz4n2FYLOOBY39h1W3D9Fay3qnoQ0v52DIGYWX1kxiG46bakcXtJmopHddZUApIxccKGlEjGZDuKznnlelGgD2TAtt2/hxVyZQ+Txuag74pDfZzuZ30+I7NGagJFrbS+OtN3czRzDGy0+PaaY/YPA/t1/42pErplKSozJ1/JbdmqtwLJO7Ycuaxs8OztQs1u3BJilWRS5c/uCMLff9nuBfZfdRkO3xKvO5nbxjUsSkmTB/4mQ=
974e892f-2c22-4d04-b841-060f1e37fa10	d533731c-5e7f-4d84-8d5a-6c6bcb399e6b	keyUse	ENC
292366db-9b3c-4ce7-a318-c0c28a087361	346742b7-3ad1-4e7b-9207-99b7a47bd550	algorithm	HS256
d61fb06d-a6ae-4cdc-888d-d148ea3e2e31	346742b7-3ad1-4e7b-9207-99b7a47bd550	kid	f5c0ce2f-cbad-498d-89ea-5d54ff2dc5c4
f3c05194-2121-4542-af93-934090461211	346742b7-3ad1-4e7b-9207-99b7a47bd550	priority	100
712d9098-d2b2-4b60-8321-13d64003808c	346742b7-3ad1-4e7b-9207-99b7a47bd550	secret	GPzqQYnvvfoPBVjfMmKMMcxfQR6WVUQYgN83XFMvzANZujBxtVD7dk44E0T5UNJNLyaU-X_12Hmut_mLBDJwkA
93981c5a-055a-4665-a4ab-9135ea3e5de2	d9faaa94-fd77-45ed-80ec-17ad4625ea41	allow-default-scopes	true
5d1b331e-8f51-4e7a-a06f-a551d3c8a1e7	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
9be77b7c-5753-44d9-b796-6c5184dc7133	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
eddac7a4-da18-4545-bde1-a646ffd05237	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	saml-user-attribute-mapper
dbd6e654-c826-4aef-a91b-984a904ad6b8	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	saml-user-property-mapper
d58a10c1-39a1-486e-8dd2-c6d7bd65756b	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	oidc-full-name-mapper
b782c4ef-4bf1-4287-ae39-15ef5603eb93	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
807772f0-6a2c-484b-8a60-84f41841c442	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	oidc-address-mapper
0a4bcf0b-6ef8-4814-9418-ec43c8036a88	69ef2ab4-977d-4452-918e-8c91e0b2ab23	allowed-protocol-mapper-types	saml-role-list-mapper
5a1abdee-7a0f-4ea5-b6a6-6b740e824ed1	04602d6c-153d-4a60-b2df-f5518544ccc7	host-sending-registration-request-must-match	true
8024b72c-4d08-454f-9d25-8ea6508cf214	04602d6c-153d-4a60-b2df-f5518544ccc7	client-uris-must-match	true
1422a70b-2a28-4c90-8aa1-0d3c2f81dc01	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	saml-user-property-mapper
e62579f1-f022-44f2-9472-602a44af94f6	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b34bfab3-5e2e-49eb-9ad4-aa55c366d901	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	oidc-full-name-mapper
f3d7ae79-cb3a-4cc9-b69f-6dae24ad9794	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	saml-user-attribute-mapper
f19fe376-91dc-4f8d-9a72-d95aa38674b9	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
16a9dd34-59d3-47c1-b1ce-b38530cfd27d	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	saml-role-list-mapper
8cd84f87-5769-4bf2-b971-afad8f6ae047	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2f0debf9-3574-469a-90d4-43f37b450d1d	dce12884-91e3-4118-8b60-99166c3e707a	allowed-protocol-mapper-types	oidc-address-mapper
15882f96-7e2c-4b58-944e-5c0b85a00d3b	1dc89aad-7148-4d4b-a8ed-02fb7e42382c	max-clients	200
eb6429e0-67de-44ad-a0b1-35da691be169	9ed397b8-79b2-43a2-b64f-de4c5bae1e99	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
b6102d6a-e534-4c30-87c1-1b827a2aac4f	c8d129cd-6d6a-48ff-b9f5-3a16419ab34c
b6102d6a-e534-4c30-87c1-1b827a2aac4f	8bfa394e-58a9-4ff6-9e68-9d2731c55f23
b6102d6a-e534-4c30-87c1-1b827a2aac4f	3da3620f-7bfb-4144-8548-a3806fb8ba7d
b6102d6a-e534-4c30-87c1-1b827a2aac4f	a6002944-4069-46fc-b402-af9e4ec42e05
b6102d6a-e534-4c30-87c1-1b827a2aac4f	6be02074-2f92-413a-8193-3d8eeda5a4f4
b6102d6a-e534-4c30-87c1-1b827a2aac4f	5c23df46-e382-4339-9456-fd2c8290bbfc
b6102d6a-e534-4c30-87c1-1b827a2aac4f	6c4807ce-6f01-417b-a0ee-1882f2f76b75
b6102d6a-e534-4c30-87c1-1b827a2aac4f	69534e95-8702-4618-a796-4a5f84c02092
b6102d6a-e534-4c30-87c1-1b827a2aac4f	c12743af-36fb-45da-a469-f8b05a1555f8
b6102d6a-e534-4c30-87c1-1b827a2aac4f	32323e89-5912-4739-85bc-5f95b2643c96
b6102d6a-e534-4c30-87c1-1b827a2aac4f	4cbe8dab-9e89-4565-b03d-587efc19d144
b6102d6a-e534-4c30-87c1-1b827a2aac4f	a115f9b8-9530-4a41-99a8-ae830351efde
b6102d6a-e534-4c30-87c1-1b827a2aac4f	f6e68b42-c619-4df4-a7ae-73c9020f2933
b6102d6a-e534-4c30-87c1-1b827a2aac4f	e05f9876-86d2-4281-ab30-c50a482e864f
b6102d6a-e534-4c30-87c1-1b827a2aac4f	a3ed6eb6-7fd1-4892-842d-981ea485ccdb
b6102d6a-e534-4c30-87c1-1b827a2aac4f	ed11462f-e4e5-4ba6-81e3-b27bf6f85057
b6102d6a-e534-4c30-87c1-1b827a2aac4f	e073a58c-6559-4138-88e7-97725b657418
b6102d6a-e534-4c30-87c1-1b827a2aac4f	63a75b4a-bcae-4d12-a37f-1c032f980244
6be02074-2f92-413a-8193-3d8eeda5a4f4	ed11462f-e4e5-4ba6-81e3-b27bf6f85057
a6002944-4069-46fc-b402-af9e4ec42e05	63a75b4a-bcae-4d12-a37f-1c032f980244
a6002944-4069-46fc-b402-af9e4ec42e05	a3ed6eb6-7fd1-4892-842d-981ea485ccdb
ecce056b-d965-47e2-aa1a-cea6be507fc4	2b40cf04-df03-42f2-bab1-6eb5532d0114
ecce056b-d965-47e2-aa1a-cea6be507fc4	cc088c2b-ab75-4075-8154-1b8d3559a2b5
cc088c2b-ab75-4075-8154-1b8d3559a2b5	916798d5-b84f-4f0e-acdb-1544b3211d07
15f20b72-b3c6-4169-8b00-54903f92acb1	a83729b5-4d8d-46e4-b0ce-d1e250ccff51
b6102d6a-e534-4c30-87c1-1b827a2aac4f	4540d274-ec4c-4dea-b76e-0603a53f1432
ecce056b-d965-47e2-aa1a-cea6be507fc4	790ad0b9-0a10-43f6-af7b-e0778d6a965a
ecce056b-d965-47e2-aa1a-cea6be507fc4	261b0f37-372f-4ecb-ab76-f84bdd830e92
b6102d6a-e534-4c30-87c1-1b827a2aac4f	8fef9af0-ce80-4d47-a3f3-0582c86bcc8d
b6102d6a-e534-4c30-87c1-1b827a2aac4f	bff97cf3-3330-4649-91aa-a5766cea2d31
b6102d6a-e534-4c30-87c1-1b827a2aac4f	5e774960-2096-4933-899a-29aac25418bc
b6102d6a-e534-4c30-87c1-1b827a2aac4f	fb937fd1-2aed-4681-a4f6-37fe18c27b86
b6102d6a-e534-4c30-87c1-1b827a2aac4f	0473f51d-fbdb-4b21-be61-c92b36bb8baa
b6102d6a-e534-4c30-87c1-1b827a2aac4f	67d4ebd2-de57-477c-bf7d-a617f910117d
b6102d6a-e534-4c30-87c1-1b827a2aac4f	3026ea8f-43a1-48c1-af27-145045c0b28c
b6102d6a-e534-4c30-87c1-1b827a2aac4f	b948fc02-4daa-4745-bf1d-ecd1b35679ea
b6102d6a-e534-4c30-87c1-1b827a2aac4f	715200fa-6098-4725-a09a-0fe7b328dd37
b6102d6a-e534-4c30-87c1-1b827a2aac4f	fe089f9a-f7ee-43d8-980e-d76e36e3efce
b6102d6a-e534-4c30-87c1-1b827a2aac4f	c17b2538-a890-4a19-987e-41a43334f8f1
b6102d6a-e534-4c30-87c1-1b827a2aac4f	ff76e2d2-725a-4b45-ad1a-2d695799511b
b6102d6a-e534-4c30-87c1-1b827a2aac4f	b683d667-eb01-42c7-b66b-de7d22483843
b6102d6a-e534-4c30-87c1-1b827a2aac4f	bd0ab732-eede-4822-8e39-1f71e107edc0
b6102d6a-e534-4c30-87c1-1b827a2aac4f	d0c913a5-31bc-4787-93d2-8b557c20a240
b6102d6a-e534-4c30-87c1-1b827a2aac4f	48363041-ed48-4d77-abe0-ec0fb4804b62
b6102d6a-e534-4c30-87c1-1b827a2aac4f	ea7053a1-33c7-48af-93b4-6f0e6cbb7ad6
5e774960-2096-4933-899a-29aac25418bc	bd0ab732-eede-4822-8e39-1f71e107edc0
5e774960-2096-4933-899a-29aac25418bc	ea7053a1-33c7-48af-93b4-6f0e6cbb7ad6
fb937fd1-2aed-4681-a4f6-37fe18c27b86	d0c913a5-31bc-4787-93d2-8b557c20a240
25989b86-e43c-41bc-b427-56e871a78ae5	299fad7b-e690-47f7-8eb7-8cb2d247516f
25989b86-e43c-41bc-b427-56e871a78ae5	6b2e9301-8256-42dc-ba12-3b607cf82276
25989b86-e43c-41bc-b427-56e871a78ae5	85c52485-3d3f-4349-a55f-9afd4e386adb
25989b86-e43c-41bc-b427-56e871a78ae5	fd67e561-3262-4017-8f5c-63f21c5e263f
25989b86-e43c-41bc-b427-56e871a78ae5	9adf61eb-d9d7-4625-9e17-f90a99502b49
25989b86-e43c-41bc-b427-56e871a78ae5	475670c9-3f69-422e-92b6-61d26bd7d865
25989b86-e43c-41bc-b427-56e871a78ae5	bbb55348-3e5f-46d0-ac5f-99139e1f3a58
25989b86-e43c-41bc-b427-56e871a78ae5	75140e4c-fa81-465d-9177-173c4f573081
25989b86-e43c-41bc-b427-56e871a78ae5	36ef9676-d3d0-4208-9b16-53b5625ec6db
25989b86-e43c-41bc-b427-56e871a78ae5	d97913e9-22db-4185-aa18-8b09e7b952f8
25989b86-e43c-41bc-b427-56e871a78ae5	38bbc04b-5bf6-4daf-8a7a-20082cfe8fb6
25989b86-e43c-41bc-b427-56e871a78ae5	ac6c93c0-bb01-4eb1-9320-15e02f37d3f8
25989b86-e43c-41bc-b427-56e871a78ae5	81d210b8-ca5e-4248-906f-1b6987782ba0
25989b86-e43c-41bc-b427-56e871a78ae5	f1db7999-dc9e-46d3-8648-9c52a5b8141a
25989b86-e43c-41bc-b427-56e871a78ae5	f4160b07-c8b7-4444-830b-7dec4313477b
25989b86-e43c-41bc-b427-56e871a78ae5	d1963094-19fb-4f8f-8d10-f60cbd163444
25989b86-e43c-41bc-b427-56e871a78ae5	a89d26ad-6453-45e4-9cc1-4ccd297d33dc
654ba425-fc4c-481b-b168-654e0c40c999	10f98462-9a11-41e2-8225-68884730961a
85c52485-3d3f-4349-a55f-9afd4e386adb	a89d26ad-6453-45e4-9cc1-4ccd297d33dc
85c52485-3d3f-4349-a55f-9afd4e386adb	f1db7999-dc9e-46d3-8648-9c52a5b8141a
fd67e561-3262-4017-8f5c-63f21c5e263f	f4160b07-c8b7-4444-830b-7dec4313477b
654ba425-fc4c-481b-b168-654e0c40c999	14102941-0bb3-4188-babf-a25a89f98b10
14102941-0bb3-4188-babf-a25a89f98b10	13bd6176-a5a4-4551-b257-c5cec5ecefd1
73fbdebe-248e-46db-affb-b05bc0bea081	ade3198c-99b5-45e1-b0bb-7d3edeb3857e
b6102d6a-e534-4c30-87c1-1b827a2aac4f	cba2a235-9fec-44eb-92ce-535879884dcd
25989b86-e43c-41bc-b427-56e871a78ae5	cdfa020d-483c-49a8-9634-fce08607cd0a
654ba425-fc4c-481b-b168-654e0c40c999	7c446627-c000-48a7-917d-4ab618270cbc
654ba425-fc4c-481b-b168-654e0c40c999	35e5e115-c817-4f3d-bceb-3caa0b647865
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
7652b556-6cf6-485b-b7fd-f019128da8c1	\N	password	bbf1942a-aa33-486f-872f-80658bf9d274	1661607810460	\N	{"value":"HMVcLseZnWk4lgA8l3FsoCUBvQKEy5rPDW60IF1Tc5lhJrOz+YBLWzkMbXyDa4NbGmmqcL0regXeEZf1X1kcMg==","salt":"lsT4iBrBxlB15cWHhsa4Kg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
46727e77-79d7-4da3-bea4-ff96f0958a5c	\N	password	77451ff3-79c4-4503-8e46-869c377b593a	1661608096354	My password	{"value":"h3DmmvuH7SWVPU071LlxtZfVuv3sdzJ3xlTYL1HcD0KO7c2jj3Bfst5dZOXa4s1WdnRlUd9lLnfXi4FAUsqJ4g==","salt":"B9UsxUsDWW02cYFUT66+CQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
29581634-73ff-4c51-ac9e-47bf8b26b53c	\N	password	d188d062-5354-4547-928b-accc0591e01a	1661608125451	My password	{"value":"PRxnZ8Yod+WWjuxPcOa6TWlIxILZP7aOxpJW9esSQy+sha2yhKdGDjmutDNZaGwD5gDZyVFvTajUyWZGRx/8zQ==","salt":"aFuENIEy5wZpT+X2cfL4pA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7c0ffdd9-f1ce-4954-a999-55fa43e8e895	\N	password	c858aea9-a744-4709-a169-9df329fe4d95	1661769832075	My password	{"value":"tQm0aWZ9gccw1xN6JuzOCH06qbW+xpLgryonp7cBq7/6vFENxTTE7Wi17fELcIsmwwZRTX45Ipt+D3OAqWIp/Q==","salt":"5EvuoYQ7PtlkHUOdT05YZw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-08-27 13:43:24.740805	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	1607803927
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-08-27 13:43:24.75336	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	1607803927
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-08-27 13:43:24.843695	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	1607803927
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-08-27 13:43:24.848178	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	1607803927
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-08-27 13:43:25.114462	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	1607803927
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-08-27 13:43:25.117238	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	1607803927
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-08-27 13:43:25.32027	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	1607803927
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-08-27 13:43:25.323414	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	1607803927
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-08-27 13:43:25.327912	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	1607803927
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-08-27 13:43:25.556701	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	1607803927
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-08-27 13:43:25.667451	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	1607803927
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-08-27 13:43:25.669653	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	1607803927
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-08-27 13:43:25.693542	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	1607803927
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-27 13:43:25.734057	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	1607803927
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-27 13:43:25.73575	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1607803927
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-27 13:43:25.737227	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	1607803927
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-27 13:43:25.738668	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	1607803927
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-08-27 13:43:25.842901	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	1607803927
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-08-27 13:43:25.941037	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	1607803927
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-08-27 13:43:25.947055	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	1607803927
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-27 13:43:26.901467	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	1607803927
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-08-27 13:43:25.950715	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	1607803927
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-08-27 13:43:25.95838	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	1607803927
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-08-27 13:43:26.005908	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	1607803927
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-08-27 13:43:26.010843	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	1607803927
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-08-27 13:43:26.012381	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	1607803927
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-08-27 13:43:26.074969	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	1607803927
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-08-27 13:43:26.271414	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	1607803927
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-08-27 13:43:26.276013	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	1607803927
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-08-27 13:43:26.45118	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	1607803927
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-08-27 13:43:26.486624	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	1607803927
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-08-27 13:43:26.5195	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	1607803927
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-08-27 13:43:26.524405	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	1607803927
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-27 13:43:26.529342	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1607803927
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-27 13:43:26.53102	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	1607803927
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-27 13:43:26.584477	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	1607803927
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-08-27 13:43:26.589751	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	1607803927
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-27 13:43:26.598022	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1607803927
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-08-27 13:43:26.601419	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	1607803927
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-08-27 13:43:26.604611	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	1607803927
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-08-27 13:43:26.606124	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	1607803927
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-08-27 13:43:26.6078	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	1607803927
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-08-27 13:43:26.612508	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	1607803927
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-08-27 13:43:26.892179	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	1607803927
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-08-27 13:43:26.895794	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	1607803927
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-27 13:43:26.909416	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	1607803927
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-27 13:43:26.91101	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	1607803927
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-27 13:43:27.008348	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	1607803927
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-27 13:43:27.013946	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	1607803927
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-08-27 13:43:27.109165	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	1607803927
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-08-27 13:43:27.17345	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	1607803927
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-08-27 13:43:27.176423	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1607803927
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-08-27 13:43:27.179361	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	1607803927
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-08-27 13:43:27.182221	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	1607803927
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-27 13:43:27.193924	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	1607803927
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-27 13:43:27.225654	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	1607803927
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-27 13:43:27.277418	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	1607803927
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-27 13:43:27.524455	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	1607803927
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-08-27 13:43:27.584121	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	1607803927
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-08-27 13:43:27.593637	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	1607803927
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-08-27 13:43:27.606873	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	1607803927
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-08-27 13:43:27.614931	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	1607803927
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-08-27 13:43:27.617866	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	1607803927
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-08-27 13:43:27.6222	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	1607803927
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-08-27 13:43:27.625103	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	1607803927
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-08-27 13:43:27.65474	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	1607803927
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-08-27 13:43:27.665998	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	1607803927
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-08-27 13:43:27.67052	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	1607803927
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-08-27 13:43:27.68689	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	1607803927
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-08-27 13:43:27.692648	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	1607803927
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-08-27 13:43:27.69829	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	1607803927
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-27 13:43:27.706913	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	1607803927
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-27 13:43:27.716229	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	1607803927
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-27 13:43:27.717604	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	1607803927
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-27 13:43:27.767362	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	1607803927
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-27 13:43:27.777412	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	1607803927
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-27 13:43:27.780536	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	1607803927
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-27 13:43:27.781936	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	1607803927
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-27 13:43:27.821524	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	1607803927
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-27 13:43:27.823283	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	1607803927
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-27 13:43:27.830747	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	1607803927
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-27 13:43:27.832395	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1607803927
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-27 13:43:27.83805	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1607803927
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-27 13:43:27.839555	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1607803927
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-27 13:43:27.847575	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	1607803927
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-08-27 13:43:27.854451	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	1607803927
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-08-27 13:43:27.868722	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	1607803927
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-08-27 13:43:27.892696	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	1607803927
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.900562	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	1607803927
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.93238	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	1607803927
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.940362	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1607803927
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.955645	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	1607803927
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.957158	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	1607803927
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.976278	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	1607803927
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.978638	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	1607803927
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-27 13:43:27.985415	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	1607803927
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.007532	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1607803927
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.009165	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1607803927
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.041313	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1607803927
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.051441	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1607803927
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.053404	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1607803927
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.063689	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	1607803927
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-27 13:43:28.070554	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	1607803927
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-08-27 13:43:28.101175	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	1607803927
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2022-08-27 13:43:28.109384	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	1607803927
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2022-08-27 13:43:28.117236	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	1607803927
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2022-08-27 13:43:28.121391	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	1607803927
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
1fe32191-f201-4478-b052-d3f2fd3c61d1	e79ac754-acf2-45e8-b4a8-ec03636fd103	f
1fe32191-f201-4478-b052-d3f2fd3c61d1	f80e909e-cd80-4b47-acec-0bad5d5e2524	t
1fe32191-f201-4478-b052-d3f2fd3c61d1	65aac617-7822-4a91-a893-146e621b39b1	t
1fe32191-f201-4478-b052-d3f2fd3c61d1	826dff6a-bf4e-43e2-acf3-8a1412c44e4c	t
1fe32191-f201-4478-b052-d3f2fd3c61d1	b0e7b27a-22db-493d-bb80-44296f9e576c	f
1fe32191-f201-4478-b052-d3f2fd3c61d1	838a2442-5e92-4686-ba1c-f8280e80d2c0	f
1fe32191-f201-4478-b052-d3f2fd3c61d1	b85c7c26-34f6-4981-b908-9b1187fb4bc6	t
1fe32191-f201-4478-b052-d3f2fd3c61d1	a3156264-b71f-4ab0-879a-c6c47c9012c1	t
1fe32191-f201-4478-b052-d3f2fd3c61d1	f98aec00-5d24-4faf-adb3-27ae4dd2feea	f
1fe32191-f201-4478-b052-d3f2fd3c61d1	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d	t
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	889d6a9c-3645-4003-b641-718f8dd493c7	f
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eeaae055-ca73-41c2-8eee-161f108c7e2c	t
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b	t
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	035ff955-1590-4737-846e-8d279c463d6f	t
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589	f
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	1edf3b1e-fd4f-465b-8207-9242139b806f	f
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	752e8de6-366f-4545-8a08-b11d1ae514f2	t
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	0e112aba-7593-4cb2-8e0b-c50683d92061	t
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f90833df-a9ce-4f42-b567-bd91b38a9b37	f
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	def1ebe5-93f9-4f98-838e-4976aac26672	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
85e2770c-3c76-4325-87a0-e905817353bf	3e88da54-c351-47dd-84c2-435c3bccd3ef
ab94ef07-a9c1-4d49-aadd-05fc58cfc176	444d2793-bdbc-4669-bf22-896d8ea78274
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
444d2793-bdbc-4669-bf22-896d8ea78274	student	 	b1fffe98-6c87-4c74-9607-fb4b4c6f837d
3e88da54-c351-47dd-84c2-435c3bccd3ef	lecturer	 	b1fffe98-6c87-4c74-9607-fb4b4c6f837d
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
ecce056b-d965-47e2-aa1a-cea6be507fc4	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	${role_default-roles}	default-roles-master	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	\N
b6102d6a-e534-4c30-87c1-1b827a2aac4f	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	${role_admin}	admin	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	\N
c8d129cd-6d6a-48ff-b9f5-3a16419ab34c	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	${role_create-realm}	create-realm	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	\N
8bfa394e-58a9-4ff6-9e68-9d2731c55f23	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_create-client}	create-client	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
3da3620f-7bfb-4144-8548-a3806fb8ba7d	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_view-realm}	view-realm	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
a6002944-4069-46fc-b402-af9e4ec42e05	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_view-users}	view-users	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
6be02074-2f92-413a-8193-3d8eeda5a4f4	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_view-clients}	view-clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
5c23df46-e382-4339-9456-fd2c8290bbfc	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_view-events}	view-events	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
6c4807ce-6f01-417b-a0ee-1882f2f76b75	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_view-identity-providers}	view-identity-providers	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
69534e95-8702-4618-a796-4a5f84c02092	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_view-authorization}	view-authorization	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
c12743af-36fb-45da-a469-f8b05a1555f8	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_manage-realm}	manage-realm	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
32323e89-5912-4739-85bc-5f95b2643c96	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_manage-users}	manage-users	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
4cbe8dab-9e89-4565-b03d-587efc19d144	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_manage-clients}	manage-clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
a115f9b8-9530-4a41-99a8-ae830351efde	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_manage-events}	manage-events	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
f6e68b42-c619-4df4-a7ae-73c9020f2933	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_manage-identity-providers}	manage-identity-providers	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
e05f9876-86d2-4281-ab30-c50a482e864f	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_manage-authorization}	manage-authorization	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
a3ed6eb6-7fd1-4892-842d-981ea485ccdb	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_query-users}	query-users	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
ed11462f-e4e5-4ba6-81e3-b27bf6f85057	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_query-clients}	query-clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
e073a58c-6559-4138-88e7-97725b657418	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_query-realms}	query-realms	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
63a75b4a-bcae-4d12-a37f-1c032f980244	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_query-groups}	query-groups	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
2b40cf04-df03-42f2-bab1-6eb5532d0114	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_view-profile}	view-profile	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
cc088c2b-ab75-4075-8154-1b8d3559a2b5	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_manage-account}	manage-account	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
916798d5-b84f-4f0e-acdb-1544b3211d07	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_manage-account-links}	manage-account-links	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
9d79af60-0d06-49ca-bdba-d2736295a68f	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_view-applications}	view-applications	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
a83729b5-4d8d-46e4-b0ce-d1e250ccff51	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_view-consent}	view-consent	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
15f20b72-b3c6-4169-8b00-54903f92acb1	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_manage-consent}	manage-consent	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
ac69cdd2-4d56-4465-abf4-e212d0b5ba40	320cf5b2-3ee2-4217-960a-9bb316e187d8	t	${role_delete-account}	delete-account	1fe32191-f201-4478-b052-d3f2fd3c61d1	320cf5b2-3ee2-4217-960a-9bb316e187d8	\N
42555b8d-bb9b-4e39-9415-b100333e05f5	71dfae22-f565-4171-a912-67857523e857	t	${role_read-token}	read-token	1fe32191-f201-4478-b052-d3f2fd3c61d1	71dfae22-f565-4171-a912-67857523e857	\N
4540d274-ec4c-4dea-b76e-0603a53f1432	898e4058-e58f-4e81-a344-ca38ee364ea3	t	${role_impersonation}	impersonation	1fe32191-f201-4478-b052-d3f2fd3c61d1	898e4058-e58f-4e81-a344-ca38ee364ea3	\N
790ad0b9-0a10-43f6-af7b-e0778d6a965a	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	${role_offline-access}	offline_access	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	\N
261b0f37-372f-4ecb-ab76-f84bdd830e92	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	${role_uma_authorization}	uma_authorization	1fe32191-f201-4478-b052-d3f2fd3c61d1	\N	\N
654ba425-fc4c-481b-b168-654e0c40c999	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f	${role_default-roles}	default-roles-gamify-it	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N	\N
8fef9af0-ce80-4d47-a3f3-0582c86bcc8d	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_create-client}	create-client	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
bff97cf3-3330-4649-91aa-a5766cea2d31	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_view-realm}	view-realm	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
5e774960-2096-4933-899a-29aac25418bc	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_view-users}	view-users	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
fb937fd1-2aed-4681-a4f6-37fe18c27b86	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_view-clients}	view-clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
0473f51d-fbdb-4b21-be61-c92b36bb8baa	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_view-events}	view-events	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
67d4ebd2-de57-477c-bf7d-a617f910117d	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_view-identity-providers}	view-identity-providers	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
3026ea8f-43a1-48c1-af27-145045c0b28c	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_view-authorization}	view-authorization	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
b948fc02-4daa-4745-bf1d-ecd1b35679ea	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_manage-realm}	manage-realm	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
715200fa-6098-4725-a09a-0fe7b328dd37	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_manage-users}	manage-users	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
fe089f9a-f7ee-43d8-980e-d76e36e3efce	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_manage-clients}	manage-clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
c17b2538-a890-4a19-987e-41a43334f8f1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_manage-events}	manage-events	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
ff76e2d2-725a-4b45-ad1a-2d695799511b	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_manage-identity-providers}	manage-identity-providers	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
b683d667-eb01-42c7-b66b-de7d22483843	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_manage-authorization}	manage-authorization	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
bd0ab732-eede-4822-8e39-1f71e107edc0	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_query-users}	query-users	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
d0c913a5-31bc-4787-93d2-8b557c20a240	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_query-clients}	query-clients	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
48363041-ed48-4d77-abe0-ec0fb4804b62	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_query-realms}	query-realms	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
ea7053a1-33c7-48af-93b4-6f0e6cbb7ad6	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_query-groups}	query-groups	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
25989b86-e43c-41bc-b427-56e871a78ae5	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_realm-admin}	realm-admin	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
299fad7b-e690-47f7-8eb7-8cb2d247516f	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_create-client}	create-client	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
6b2e9301-8256-42dc-ba12-3b607cf82276	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_view-realm}	view-realm	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
85c52485-3d3f-4349-a55f-9afd4e386adb	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_view-users}	view-users	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
fd67e561-3262-4017-8f5c-63f21c5e263f	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_view-clients}	view-clients	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
9adf61eb-d9d7-4625-9e17-f90a99502b49	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_view-events}	view-events	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
475670c9-3f69-422e-92b6-61d26bd7d865	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_view-identity-providers}	view-identity-providers	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
bbb55348-3e5f-46d0-ac5f-99139e1f3a58	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_view-authorization}	view-authorization	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
75140e4c-fa81-465d-9177-173c4f573081	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_manage-realm}	manage-realm	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
36ef9676-d3d0-4208-9b16-53b5625ec6db	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_manage-users}	manage-users	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
d97913e9-22db-4185-aa18-8b09e7b952f8	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_manage-clients}	manage-clients	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
38bbc04b-5bf6-4daf-8a7a-20082cfe8fb6	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_manage-events}	manage-events	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
ac6c93c0-bb01-4eb1-9320-15e02f37d3f8	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_manage-identity-providers}	manage-identity-providers	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
81d210b8-ca5e-4248-906f-1b6987782ba0	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_manage-authorization}	manage-authorization	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
f1db7999-dc9e-46d3-8648-9c52a5b8141a	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_query-users}	query-users	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
f4160b07-c8b7-4444-830b-7dec4313477b	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_query-clients}	query-clients	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
d1963094-19fb-4f8f-8d10-f60cbd163444	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_query-realms}	query-realms	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
a89d26ad-6453-45e4-9cc1-4ccd297d33dc	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_query-groups}	query-groups	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
10f98462-9a11-41e2-8225-68884730961a	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_view-profile}	view-profile	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
14102941-0bb3-4188-babf-a25a89f98b10	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_manage-account}	manage-account	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
13bd6176-a5a4-4551-b257-c5cec5ecefd1	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_manage-account-links}	manage-account-links	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
1735071f-ff8a-4978-9860-9067bab1a948	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_view-applications}	view-applications	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
ade3198c-99b5-45e1-b0bb-7d3edeb3857e	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_view-consent}	view-consent	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
73fbdebe-248e-46db-affb-b05bc0bea081	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_manage-consent}	manage-consent	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
4f515e28-9891-4dc1-8678-8fb0befe2261	cb8e206d-aed8-4b85-9cea-9bc7406a935c	t	${role_delete-account}	delete-account	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	cb8e206d-aed8-4b85-9cea-9bc7406a935c	\N
cba2a235-9fec-44eb-92ce-535879884dcd	297e8395-0d33-42a3-93d5-cb08b0cee9bf	t	${role_impersonation}	impersonation	1fe32191-f201-4478-b052-d3f2fd3c61d1	297e8395-0d33-42a3-93d5-cb08b0cee9bf	\N
cdfa020d-483c-49a8-9634-fce08607cd0a	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	t	${role_impersonation}	impersonation	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
62fce896-82ea-479e-843c-ee5d7c1ff3a6	df8f2cb2-62da-4d73-88a8-7a540b093cc6	t	${role_read-token}	read-token	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	df8f2cb2-62da-4d73-88a8-7a540b093cc6	\N
7c446627-c000-48a7-917d-4ab618270cbc	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f	${role_offline-access}	offline_access	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N	\N
35e5e115-c817-4f3d-bceb-3caa0b647865	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f	${role_uma_authorization}	uma_authorization	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N	\N
85e2770c-3c76-4325-87a0-e905817353bf	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f		lecturer	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N	\N
ab94ef07-a9c1-4d49-aadd-05fc58cfc176	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f		student	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
wo8ja	19.0.1	1661607808
vbnut	19.0.3	1681159469
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
41464ad2-3623-4512-b307-e68c789ad321	audience resolve	openid-connect	oidc-audience-resolve-mapper	2553be04-c600-4eb7-997f-40541b6d1711	\N
28cbf07b-6e85-4b21-bcd7-cb85f1616818	locale	openid-connect	oidc-usermodel-attribute-mapper	982e82ac-9f63-4105-86e3-e1f3afd3f0f4	\N
8d190bac-f850-4ad7-9a3f-34be66fdfdbb	role list	saml	saml-role-list-mapper	\N	f80e909e-cd80-4b47-acec-0bad5d5e2524
e920033d-2e93-4299-ac65-b2e36262a8b8	full name	openid-connect	oidc-full-name-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	family name	openid-connect	oidc-usermodel-property-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	given name	openid-connect	oidc-usermodel-property-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
9305b451-94a5-4615-b18a-f8ac5759647d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
0a715656-aa38-4a21-83c6-920fa8a16546	username	openid-connect	oidc-usermodel-property-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
d017f9da-4229-4925-a5ae-f3d05b917833	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
d8dce949-baad-4aa8-893b-9fe877eb8948	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
cc89b2d7-8d83-42ca-be05-3527475d5568	website	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
bdd4c7f1-4910-4b60-9c02-526532eda3b9	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
6729ea83-0aa7-45b7-84c4-c06b230cfa16	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
d8745d86-0fc8-4e68-b0a8-6067d7483352	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
f1d0a5cf-22b9-4c69-a814-196ac5368a60	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	65aac617-7822-4a91-a893-146e621b39b1
895bf915-591c-473f-99e6-7395de2140cf	email	openid-connect	oidc-usermodel-property-mapper	\N	826dff6a-bf4e-43e2-acf3-8a1412c44e4c
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	email verified	openid-connect	oidc-usermodel-property-mapper	\N	826dff6a-bf4e-43e2-acf3-8a1412c44e4c
e85b477e-7a63-4016-aba0-e76506e46674	address	openid-connect	oidc-address-mapper	\N	b0e7b27a-22db-493d-bb80-44296f9e576c
5d3c4133-d647-4920-b60f-5cbbb206029c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	838a2442-5e92-4686-ba1c-f8280e80d2c0
254c9fc1-dcba-4749-8f07-17fd68394ef4	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	838a2442-5e92-4686-ba1c-f8280e80d2c0
bbdde822-3fe6-4fda-a351-c4e156f3f4bf	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	b85c7c26-34f6-4981-b908-9b1187fb4bc6
6ac30fbb-28cf-4a7e-9ab9-557029e3d001	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	b85c7c26-34f6-4981-b908-9b1187fb4bc6
160d7b37-fe30-4ce9-a4e7-cc02b4d80cb9	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	b85c7c26-34f6-4981-b908-9b1187fb4bc6
55c9135a-7aba-471f-b486-9cbb1b44bfc7	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	a3156264-b71f-4ab0-879a-c6c47c9012c1
2d0b8332-80c1-48c3-8155-f980506ef117	upn	openid-connect	oidc-usermodel-property-mapper	\N	f98aec00-5d24-4faf-adb3-27ae4dd2feea
ad248b1f-1116-4771-82ed-e1767cb572ff	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f98aec00-5d24-4faf-adb3-27ae4dd2feea
7d137983-50f7-4ec6-bede-38311bb38931	acr loa level	openid-connect	oidc-acr-mapper	\N	07bb07aa-b40f-4c96-a8c0-b01a25c92e6d
22b9c6bb-c16d-4ca6-8a61-574fed100671	audience resolve	openid-connect	oidc-audience-resolve-mapper	5811e4e5-a6f7-4aac-8def-8a53bd91600d	\N
bedda6d0-60dc-41cf-86d7-0801b2898c53	role list	saml	saml-role-list-mapper	\N	eeaae055-ca73-41c2-8eee-161f108c7e2c
abec68a4-7146-44bc-a6f3-a6865a6b0761	full name	openid-connect	oidc-full-name-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	family name	openid-connect	oidc-usermodel-property-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
b050916d-df6a-42da-b2c5-9ecc42c6e937	given name	openid-connect	oidc-usermodel-property-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
083150f6-9184-4f67-a58d-4b2955dce883	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
090b4ac3-b7f7-45c2-aa30-de6692e85b78	username	openid-connect	oidc-usermodel-property-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
43a2606c-a865-4e1b-818f-64129e153c52	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
4551efe4-34cd-4800-b12d-8fb950814bd9	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	website	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
c37c96e0-870e-403a-bb23-b61eff8b9bd3	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
01ad18a4-152d-45a9-87f6-5119127f8e80	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
c20380ec-cd05-427a-886c-603af48779c6	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
6831b867-e5c8-41e9-affc-a312048979f5	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	0693ee26-b2ed-4ed5-a8de-ebf41fd9b78b
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	email	openid-connect	oidc-usermodel-property-mapper	\N	035ff955-1590-4737-846e-8d279c463d6f
36c3622e-53e9-48f6-a890-7bfccc18276e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	035ff955-1590-4737-846e-8d279c463d6f
acd40983-572b-41c6-bf4a-f8cd0ae9773e	address	openid-connect	oidc-address-mapper	\N	a0d7dfad-6ae2-41c9-b5e1-3d9dcd707589
5a995a7b-853c-4945-a757-b23d04010215	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	1edf3b1e-fd4f-465b-8207-9242139b806f
36325ac8-8971-4a8a-8f04-8f513b410885	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	1edf3b1e-fd4f-465b-8207-9242139b806f
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	752e8de6-366f-4545-8a08-b11d1ae514f2
2f76b7a6-9f73-499f-b0e6-5159e311883b	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	752e8de6-366f-4545-8a08-b11d1ae514f2
d3c1a769-4a66-41f0-a08f-7b70b7958ad1	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	752e8de6-366f-4545-8a08-b11d1ae514f2
7eb374a6-cf6f-4092-98b0-501196cf2bbf	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	0e112aba-7593-4cb2-8e0b-c50683d92061
1c20b97d-8ba3-46a2-9bfa-828ec821a237	upn	openid-connect	oidc-usermodel-property-mapper	\N	f90833df-a9ce-4f42-b567-bd91b38a9b37
02a5e3a6-25ab-425c-8418-82ddbc27d25a	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f90833df-a9ce-4f42-b567-bd91b38a9b37
b2ff121f-64c8-4943-addb-b2b2d238f14b	acr loa level	openid-connect	oidc-acr-mapper	\N	def1ebe5-93f9-4f98-838e-4976aac26672
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	locale	openid-connect	oidc-usermodel-attribute-mapper	740be63d-cd29-4660-892e-12ad842087d8	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
28cbf07b-6e85-4b21-bcd7-cb85f1616818	true	userinfo.token.claim
28cbf07b-6e85-4b21-bcd7-cb85f1616818	locale	user.attribute
28cbf07b-6e85-4b21-bcd7-cb85f1616818	true	id.token.claim
28cbf07b-6e85-4b21-bcd7-cb85f1616818	true	access.token.claim
28cbf07b-6e85-4b21-bcd7-cb85f1616818	locale	claim.name
28cbf07b-6e85-4b21-bcd7-cb85f1616818	String	jsonType.label
8d190bac-f850-4ad7-9a3f-34be66fdfdbb	false	single
8d190bac-f850-4ad7-9a3f-34be66fdfdbb	Basic	attribute.nameformat
8d190bac-f850-4ad7-9a3f-34be66fdfdbb	Role	attribute.name
0a715656-aa38-4a21-83c6-920fa8a16546	true	userinfo.token.claim
0a715656-aa38-4a21-83c6-920fa8a16546	username	user.attribute
0a715656-aa38-4a21-83c6-920fa8a16546	true	id.token.claim
0a715656-aa38-4a21-83c6-920fa8a16546	true	access.token.claim
0a715656-aa38-4a21-83c6-920fa8a16546	preferred_username	claim.name
0a715656-aa38-4a21-83c6-920fa8a16546	String	jsonType.label
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	true	userinfo.token.claim
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	gender	user.attribute
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	true	id.token.claim
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	true	access.token.claim
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	gender	claim.name
2cd6b181-39f9-4a28-ae70-e9fcce7fa1ab	String	jsonType.label
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	true	userinfo.token.claim
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	nickname	user.attribute
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	true	id.token.claim
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	true	access.token.claim
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	nickname	claim.name
5a4c7f8d-08b6-4d09-bbc9-48099ad19e71	String	jsonType.label
6729ea83-0aa7-45b7-84c4-c06b230cfa16	true	userinfo.token.claim
6729ea83-0aa7-45b7-84c4-c06b230cfa16	zoneinfo	user.attribute
6729ea83-0aa7-45b7-84c4-c06b230cfa16	true	id.token.claim
6729ea83-0aa7-45b7-84c4-c06b230cfa16	true	access.token.claim
6729ea83-0aa7-45b7-84c4-c06b230cfa16	zoneinfo	claim.name
6729ea83-0aa7-45b7-84c4-c06b230cfa16	String	jsonType.label
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	true	userinfo.token.claim
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	lastName	user.attribute
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	true	id.token.claim
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	true	access.token.claim
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	family_name	claim.name
8fa24509-8fa1-49ac-a3a2-3c4c727cf31c	String	jsonType.label
9305b451-94a5-4615-b18a-f8ac5759647d	true	userinfo.token.claim
9305b451-94a5-4615-b18a-f8ac5759647d	middleName	user.attribute
9305b451-94a5-4615-b18a-f8ac5759647d	true	id.token.claim
9305b451-94a5-4615-b18a-f8ac5759647d	true	access.token.claim
9305b451-94a5-4615-b18a-f8ac5759647d	middle_name	claim.name
9305b451-94a5-4615-b18a-f8ac5759647d	String	jsonType.label
bdd4c7f1-4910-4b60-9c02-526532eda3b9	true	userinfo.token.claim
bdd4c7f1-4910-4b60-9c02-526532eda3b9	birthdate	user.attribute
bdd4c7f1-4910-4b60-9c02-526532eda3b9	true	id.token.claim
bdd4c7f1-4910-4b60-9c02-526532eda3b9	true	access.token.claim
bdd4c7f1-4910-4b60-9c02-526532eda3b9	birthdate	claim.name
bdd4c7f1-4910-4b60-9c02-526532eda3b9	String	jsonType.label
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	true	userinfo.token.claim
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	firstName	user.attribute
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	true	id.token.claim
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	true	access.token.claim
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	given_name	claim.name
be584d6b-d739-4fc9-aa0d-4b1acf1c61fe	String	jsonType.label
cc89b2d7-8d83-42ca-be05-3527475d5568	true	userinfo.token.claim
cc89b2d7-8d83-42ca-be05-3527475d5568	website	user.attribute
cc89b2d7-8d83-42ca-be05-3527475d5568	true	id.token.claim
cc89b2d7-8d83-42ca-be05-3527475d5568	true	access.token.claim
cc89b2d7-8d83-42ca-be05-3527475d5568	website	claim.name
cc89b2d7-8d83-42ca-be05-3527475d5568	String	jsonType.label
d017f9da-4229-4925-a5ae-f3d05b917833	true	userinfo.token.claim
d017f9da-4229-4925-a5ae-f3d05b917833	profile	user.attribute
d017f9da-4229-4925-a5ae-f3d05b917833	true	id.token.claim
d017f9da-4229-4925-a5ae-f3d05b917833	true	access.token.claim
d017f9da-4229-4925-a5ae-f3d05b917833	profile	claim.name
d017f9da-4229-4925-a5ae-f3d05b917833	String	jsonType.label
d8745d86-0fc8-4e68-b0a8-6067d7483352	true	userinfo.token.claim
d8745d86-0fc8-4e68-b0a8-6067d7483352	locale	user.attribute
d8745d86-0fc8-4e68-b0a8-6067d7483352	true	id.token.claim
d8745d86-0fc8-4e68-b0a8-6067d7483352	true	access.token.claim
d8745d86-0fc8-4e68-b0a8-6067d7483352	locale	claim.name
d8745d86-0fc8-4e68-b0a8-6067d7483352	String	jsonType.label
d8dce949-baad-4aa8-893b-9fe877eb8948	true	userinfo.token.claim
d8dce949-baad-4aa8-893b-9fe877eb8948	picture	user.attribute
d8dce949-baad-4aa8-893b-9fe877eb8948	true	id.token.claim
d8dce949-baad-4aa8-893b-9fe877eb8948	true	access.token.claim
d8dce949-baad-4aa8-893b-9fe877eb8948	picture	claim.name
d8dce949-baad-4aa8-893b-9fe877eb8948	String	jsonType.label
e920033d-2e93-4299-ac65-b2e36262a8b8	true	userinfo.token.claim
e920033d-2e93-4299-ac65-b2e36262a8b8	true	id.token.claim
e920033d-2e93-4299-ac65-b2e36262a8b8	true	access.token.claim
f1d0a5cf-22b9-4c69-a814-196ac5368a60	true	userinfo.token.claim
f1d0a5cf-22b9-4c69-a814-196ac5368a60	updatedAt	user.attribute
f1d0a5cf-22b9-4c69-a814-196ac5368a60	true	id.token.claim
f1d0a5cf-22b9-4c69-a814-196ac5368a60	true	access.token.claim
f1d0a5cf-22b9-4c69-a814-196ac5368a60	updated_at	claim.name
f1d0a5cf-22b9-4c69-a814-196ac5368a60	long	jsonType.label
895bf915-591c-473f-99e6-7395de2140cf	true	userinfo.token.claim
895bf915-591c-473f-99e6-7395de2140cf	email	user.attribute
895bf915-591c-473f-99e6-7395de2140cf	true	id.token.claim
895bf915-591c-473f-99e6-7395de2140cf	true	access.token.claim
895bf915-591c-473f-99e6-7395de2140cf	email	claim.name
895bf915-591c-473f-99e6-7395de2140cf	String	jsonType.label
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	true	userinfo.token.claim
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	emailVerified	user.attribute
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	true	id.token.claim
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	true	access.token.claim
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	email_verified	claim.name
8b94e5f3-e1bb-44c3-ae0d-49c64495a819	boolean	jsonType.label
e85b477e-7a63-4016-aba0-e76506e46674	formatted	user.attribute.formatted
e85b477e-7a63-4016-aba0-e76506e46674	country	user.attribute.country
e85b477e-7a63-4016-aba0-e76506e46674	postal_code	user.attribute.postal_code
e85b477e-7a63-4016-aba0-e76506e46674	true	userinfo.token.claim
e85b477e-7a63-4016-aba0-e76506e46674	street	user.attribute.street
e85b477e-7a63-4016-aba0-e76506e46674	true	id.token.claim
e85b477e-7a63-4016-aba0-e76506e46674	region	user.attribute.region
e85b477e-7a63-4016-aba0-e76506e46674	true	access.token.claim
e85b477e-7a63-4016-aba0-e76506e46674	locality	user.attribute.locality
254c9fc1-dcba-4749-8f07-17fd68394ef4	true	userinfo.token.claim
254c9fc1-dcba-4749-8f07-17fd68394ef4	phoneNumberVerified	user.attribute
254c9fc1-dcba-4749-8f07-17fd68394ef4	true	id.token.claim
254c9fc1-dcba-4749-8f07-17fd68394ef4	true	access.token.claim
254c9fc1-dcba-4749-8f07-17fd68394ef4	phone_number_verified	claim.name
254c9fc1-dcba-4749-8f07-17fd68394ef4	boolean	jsonType.label
5d3c4133-d647-4920-b60f-5cbbb206029c	true	userinfo.token.claim
5d3c4133-d647-4920-b60f-5cbbb206029c	phoneNumber	user.attribute
5d3c4133-d647-4920-b60f-5cbbb206029c	true	id.token.claim
5d3c4133-d647-4920-b60f-5cbbb206029c	true	access.token.claim
5d3c4133-d647-4920-b60f-5cbbb206029c	phone_number	claim.name
5d3c4133-d647-4920-b60f-5cbbb206029c	String	jsonType.label
6ac30fbb-28cf-4a7e-9ab9-557029e3d001	true	multivalued
6ac30fbb-28cf-4a7e-9ab9-557029e3d001	foo	user.attribute
6ac30fbb-28cf-4a7e-9ab9-557029e3d001	true	access.token.claim
6ac30fbb-28cf-4a7e-9ab9-557029e3d001	resource_access.${client_id}.roles	claim.name
6ac30fbb-28cf-4a7e-9ab9-557029e3d001	String	jsonType.label
bbdde822-3fe6-4fda-a351-c4e156f3f4bf	true	multivalued
bbdde822-3fe6-4fda-a351-c4e156f3f4bf	foo	user.attribute
bbdde822-3fe6-4fda-a351-c4e156f3f4bf	true	access.token.claim
bbdde822-3fe6-4fda-a351-c4e156f3f4bf	realm_access.roles	claim.name
bbdde822-3fe6-4fda-a351-c4e156f3f4bf	String	jsonType.label
2d0b8332-80c1-48c3-8155-f980506ef117	true	userinfo.token.claim
2d0b8332-80c1-48c3-8155-f980506ef117	username	user.attribute
2d0b8332-80c1-48c3-8155-f980506ef117	true	id.token.claim
2d0b8332-80c1-48c3-8155-f980506ef117	true	access.token.claim
2d0b8332-80c1-48c3-8155-f980506ef117	upn	claim.name
2d0b8332-80c1-48c3-8155-f980506ef117	String	jsonType.label
ad248b1f-1116-4771-82ed-e1767cb572ff	true	multivalued
ad248b1f-1116-4771-82ed-e1767cb572ff	foo	user.attribute
ad248b1f-1116-4771-82ed-e1767cb572ff	true	id.token.claim
ad248b1f-1116-4771-82ed-e1767cb572ff	true	access.token.claim
ad248b1f-1116-4771-82ed-e1767cb572ff	groups	claim.name
ad248b1f-1116-4771-82ed-e1767cb572ff	String	jsonType.label
7d137983-50f7-4ec6-bede-38311bb38931	true	id.token.claim
7d137983-50f7-4ec6-bede-38311bb38931	true	access.token.claim
bedda6d0-60dc-41cf-86d7-0801b2898c53	false	single
bedda6d0-60dc-41cf-86d7-0801b2898c53	Basic	attribute.nameformat
bedda6d0-60dc-41cf-86d7-0801b2898c53	Role	attribute.name
01ad18a4-152d-45a9-87f6-5119127f8e80	true	userinfo.token.claim
01ad18a4-152d-45a9-87f6-5119127f8e80	birthdate	user.attribute
01ad18a4-152d-45a9-87f6-5119127f8e80	true	id.token.claim
01ad18a4-152d-45a9-87f6-5119127f8e80	true	access.token.claim
01ad18a4-152d-45a9-87f6-5119127f8e80	birthdate	claim.name
01ad18a4-152d-45a9-87f6-5119127f8e80	String	jsonType.label
083150f6-9184-4f67-a58d-4b2955dce883	true	userinfo.token.claim
083150f6-9184-4f67-a58d-4b2955dce883	nickname	user.attribute
083150f6-9184-4f67-a58d-4b2955dce883	true	id.token.claim
083150f6-9184-4f67-a58d-4b2955dce883	true	access.token.claim
083150f6-9184-4f67-a58d-4b2955dce883	nickname	claim.name
083150f6-9184-4f67-a58d-4b2955dce883	String	jsonType.label
090b4ac3-b7f7-45c2-aa30-de6692e85b78	true	userinfo.token.claim
090b4ac3-b7f7-45c2-aa30-de6692e85b78	username	user.attribute
090b4ac3-b7f7-45c2-aa30-de6692e85b78	true	id.token.claim
090b4ac3-b7f7-45c2-aa30-de6692e85b78	true	access.token.claim
090b4ac3-b7f7-45c2-aa30-de6692e85b78	preferred_username	claim.name
090b4ac3-b7f7-45c2-aa30-de6692e85b78	String	jsonType.label
43a2606c-a865-4e1b-818f-64129e153c52	true	userinfo.token.claim
43a2606c-a865-4e1b-818f-64129e153c52	profile	user.attribute
43a2606c-a865-4e1b-818f-64129e153c52	true	id.token.claim
43a2606c-a865-4e1b-818f-64129e153c52	true	access.token.claim
43a2606c-a865-4e1b-818f-64129e153c52	profile	claim.name
43a2606c-a865-4e1b-818f-64129e153c52	String	jsonType.label
4551efe4-34cd-4800-b12d-8fb950814bd9	true	userinfo.token.claim
4551efe4-34cd-4800-b12d-8fb950814bd9	picture	user.attribute
4551efe4-34cd-4800-b12d-8fb950814bd9	true	id.token.claim
4551efe4-34cd-4800-b12d-8fb950814bd9	true	access.token.claim
4551efe4-34cd-4800-b12d-8fb950814bd9	picture	claim.name
4551efe4-34cd-4800-b12d-8fb950814bd9	String	jsonType.label
6831b867-e5c8-41e9-affc-a312048979f5	true	userinfo.token.claim
6831b867-e5c8-41e9-affc-a312048979f5	locale	user.attribute
6831b867-e5c8-41e9-affc-a312048979f5	true	id.token.claim
6831b867-e5c8-41e9-affc-a312048979f5	true	access.token.claim
6831b867-e5c8-41e9-affc-a312048979f5	locale	claim.name
6831b867-e5c8-41e9-affc-a312048979f5	String	jsonType.label
abec68a4-7146-44bc-a6f3-a6865a6b0761	true	userinfo.token.claim
abec68a4-7146-44bc-a6f3-a6865a6b0761	true	id.token.claim
abec68a4-7146-44bc-a6f3-a6865a6b0761	true	access.token.claim
b050916d-df6a-42da-b2c5-9ecc42c6e937	true	userinfo.token.claim
b050916d-df6a-42da-b2c5-9ecc42c6e937	firstName	user.attribute
b050916d-df6a-42da-b2c5-9ecc42c6e937	true	id.token.claim
b050916d-df6a-42da-b2c5-9ecc42c6e937	true	access.token.claim
b050916d-df6a-42da-b2c5-9ecc42c6e937	given_name	claim.name
b050916d-df6a-42da-b2c5-9ecc42c6e937	String	jsonType.label
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	true	userinfo.token.claim
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	middleName	user.attribute
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	true	id.token.claim
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	true	access.token.claim
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	middle_name	claim.name
b3ab879b-d316-41b4-b2b2-dbeb5d4e1ffe	String	jsonType.label
c20380ec-cd05-427a-886c-603af48779c6	true	userinfo.token.claim
c20380ec-cd05-427a-886c-603af48779c6	zoneinfo	user.attribute
c20380ec-cd05-427a-886c-603af48779c6	true	id.token.claim
c20380ec-cd05-427a-886c-603af48779c6	true	access.token.claim
c20380ec-cd05-427a-886c-603af48779c6	zoneinfo	claim.name
c20380ec-cd05-427a-886c-603af48779c6	String	jsonType.label
c37c96e0-870e-403a-bb23-b61eff8b9bd3	true	userinfo.token.claim
c37c96e0-870e-403a-bb23-b61eff8b9bd3	gender	user.attribute
c37c96e0-870e-403a-bb23-b61eff8b9bd3	true	id.token.claim
c37c96e0-870e-403a-bb23-b61eff8b9bd3	true	access.token.claim
c37c96e0-870e-403a-bb23-b61eff8b9bd3	gender	claim.name
c37c96e0-870e-403a-bb23-b61eff8b9bd3	String	jsonType.label
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	true	userinfo.token.claim
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	website	user.attribute
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	true	id.token.claim
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	true	access.token.claim
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	website	claim.name
cb9cc9cf-cfa5-4830-9c28-4363588f9bd6	String	jsonType.label
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	true	userinfo.token.claim
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	lastName	user.attribute
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	true	id.token.claim
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	true	access.token.claim
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	family_name	claim.name
e8d37724-1c94-4ee3-b1a1-6c48a33e1315	String	jsonType.label
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	true	userinfo.token.claim
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	updatedAt	user.attribute
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	true	id.token.claim
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	true	access.token.claim
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	updated_at	claim.name
fe4b7605-02f8-4e69-afbd-6ed5a86fa1f0	long	jsonType.label
36c3622e-53e9-48f6-a890-7bfccc18276e	true	userinfo.token.claim
36c3622e-53e9-48f6-a890-7bfccc18276e	emailVerified	user.attribute
36c3622e-53e9-48f6-a890-7bfccc18276e	true	id.token.claim
36c3622e-53e9-48f6-a890-7bfccc18276e	true	access.token.claim
36c3622e-53e9-48f6-a890-7bfccc18276e	email_verified	claim.name
36c3622e-53e9-48f6-a890-7bfccc18276e	boolean	jsonType.label
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	true	userinfo.token.claim
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	email	user.attribute
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	true	id.token.claim
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	true	access.token.claim
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	email	claim.name
7005a0f4-5c93-40cf-bb91-02c4dc4a3ec9	String	jsonType.label
acd40983-572b-41c6-bf4a-f8cd0ae9773e	formatted	user.attribute.formatted
acd40983-572b-41c6-bf4a-f8cd0ae9773e	country	user.attribute.country
acd40983-572b-41c6-bf4a-f8cd0ae9773e	postal_code	user.attribute.postal_code
acd40983-572b-41c6-bf4a-f8cd0ae9773e	true	userinfo.token.claim
acd40983-572b-41c6-bf4a-f8cd0ae9773e	street	user.attribute.street
acd40983-572b-41c6-bf4a-f8cd0ae9773e	true	id.token.claim
acd40983-572b-41c6-bf4a-f8cd0ae9773e	region	user.attribute.region
acd40983-572b-41c6-bf4a-f8cd0ae9773e	true	access.token.claim
acd40983-572b-41c6-bf4a-f8cd0ae9773e	locality	user.attribute.locality
36325ac8-8971-4a8a-8f04-8f513b410885	true	userinfo.token.claim
36325ac8-8971-4a8a-8f04-8f513b410885	phoneNumberVerified	user.attribute
36325ac8-8971-4a8a-8f04-8f513b410885	true	id.token.claim
36325ac8-8971-4a8a-8f04-8f513b410885	true	access.token.claim
36325ac8-8971-4a8a-8f04-8f513b410885	phone_number_verified	claim.name
36325ac8-8971-4a8a-8f04-8f513b410885	boolean	jsonType.label
5a995a7b-853c-4945-a757-b23d04010215	true	userinfo.token.claim
5a995a7b-853c-4945-a757-b23d04010215	phoneNumber	user.attribute
5a995a7b-853c-4945-a757-b23d04010215	true	id.token.claim
5a995a7b-853c-4945-a757-b23d04010215	true	access.token.claim
5a995a7b-853c-4945-a757-b23d04010215	phone_number	claim.name
5a995a7b-853c-4945-a757-b23d04010215	String	jsonType.label
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	true	multivalued
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	true	access.token.claim
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	realm_access.roles	claim.name
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	String	jsonType.label
2f76b7a6-9f73-499f-b0e6-5159e311883b	true	multivalued
2f76b7a6-9f73-499f-b0e6-5159e311883b	foo	user.attribute
2f76b7a6-9f73-499f-b0e6-5159e311883b	true	access.token.claim
2f76b7a6-9f73-499f-b0e6-5159e311883b	resource_access.${client_id}.roles	claim.name
2f76b7a6-9f73-499f-b0e6-5159e311883b	String	jsonType.label
02a5e3a6-25ab-425c-8418-82ddbc27d25a	true	multivalued
02a5e3a6-25ab-425c-8418-82ddbc27d25a	foo	user.attribute
02a5e3a6-25ab-425c-8418-82ddbc27d25a	true	id.token.claim
02a5e3a6-25ab-425c-8418-82ddbc27d25a	true	access.token.claim
02a5e3a6-25ab-425c-8418-82ddbc27d25a	groups	claim.name
02a5e3a6-25ab-425c-8418-82ddbc27d25a	String	jsonType.label
1c20b97d-8ba3-46a2-9bfa-828ec821a237	true	userinfo.token.claim
1c20b97d-8ba3-46a2-9bfa-828ec821a237	username	user.attribute
1c20b97d-8ba3-46a2-9bfa-828ec821a237	true	id.token.claim
1c20b97d-8ba3-46a2-9bfa-828ec821a237	true	access.token.claim
1c20b97d-8ba3-46a2-9bfa-828ec821a237	upn	claim.name
1c20b97d-8ba3-46a2-9bfa-828ec821a237	String	jsonType.label
b2ff121f-64c8-4943-addb-b2b2d238f14b	true	id.token.claim
b2ff121f-64c8-4943-addb-b2b2d238f14b	true	access.token.claim
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	true	userinfo.token.claim
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	locale	user.attribute
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	true	id.token.claim
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	true	access.token.claim
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	locale	claim.name
3bda37c6-dbf5-47bd-b039-bc1f10e4494f	String	jsonType.label
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	true	id.token.claim
2e1d08d7-0a37-45bc-a759-9e8a12d60c2d	true	userinfo.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
1fe32191-f201-4478-b052-d3f2fd3c61d1	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	898e4058-e58f-4e81-a344-ca38ee364ea3	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	95cdea80-1925-4c4f-881f-3789b39274e2	66963d32-25d8-4596-ae14-f906ff1c946b	ff41a012-596b-4237-81fa-d6ca72da4296	1d34eff6-9603-45be-ba0b-adefffbc79e9	368b0e28-04c3-4613-8674-ece6a59c8016	2592000	f	900	t	f	d74bb65d-06ce-457a-9bf0-e1a8e74a9770	0	f	0	0	ecce056b-d965-47e2-aa1a-cea6be507fc4
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	60	300	300	\N	\N	\N	t	f	0	\N	Gamify-IT	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	297e8395-0d33-42a3-93d5-cb08b0cee9bf	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	c039d103-48d9-4fb4-b6f4-7259be670fc8	be211627-d131-4272-a4bb-a49e1c4ea75f	3aaf64b2-a83b-45c8-ab0f-12fb5f28ff30	acccee70-52e7-4640-8142-f14355aa1c73	057030fc-ba4c-4ef5-b22b-e6e1932ed96e	2592000	f	900	t	f	9828ce2e-62c3-47e4-bdc0-0bdc39fb0dee	0	f	0	0	654ba425-fc4c-481b-b168-654e0c40c999
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	1fe32191-f201-4478-b052-d3f2fd3c61d1	
_browser_header.xContentTypeOptions	1fe32191-f201-4478-b052-d3f2fd3c61d1	nosniff
_browser_header.xRobotsTag	1fe32191-f201-4478-b052-d3f2fd3c61d1	none
_browser_header.xFrameOptions	1fe32191-f201-4478-b052-d3f2fd3c61d1	SAMEORIGIN
_browser_header.contentSecurityPolicy	1fe32191-f201-4478-b052-d3f2fd3c61d1	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	1fe32191-f201-4478-b052-d3f2fd3c61d1	1; mode=block
_browser_header.strictTransportSecurity	1fe32191-f201-4478-b052-d3f2fd3c61d1	max-age=31536000; includeSubDomains
bruteForceProtected	1fe32191-f201-4478-b052-d3f2fd3c61d1	false
permanentLockout	1fe32191-f201-4478-b052-d3f2fd3c61d1	false
maxFailureWaitSeconds	1fe32191-f201-4478-b052-d3f2fd3c61d1	900
minimumQuickLoginWaitSeconds	1fe32191-f201-4478-b052-d3f2fd3c61d1	60
waitIncrementSeconds	1fe32191-f201-4478-b052-d3f2fd3c61d1	60
quickLoginCheckMilliSeconds	1fe32191-f201-4478-b052-d3f2fd3c61d1	1000
maxDeltaTimeSeconds	1fe32191-f201-4478-b052-d3f2fd3c61d1	43200
failureFactor	1fe32191-f201-4478-b052-d3f2fd3c61d1	30
displayName	1fe32191-f201-4478-b052-d3f2fd3c61d1	Keycloak
displayNameHtml	1fe32191-f201-4478-b052-d3f2fd3c61d1	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	1fe32191-f201-4478-b052-d3f2fd3c61d1	RS256
offlineSessionMaxLifespanEnabled	1fe32191-f201-4478-b052-d3f2fd3c61d1	false
offlineSessionMaxLifespan	1fe32191-f201-4478-b052-d3f2fd3c61d1	5184000
_browser_header.contentSecurityPolicyReportOnly	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	
_browser_header.xContentTypeOptions	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	nosniff
_browser_header.xRobotsTag	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	none
_browser_header.xFrameOptions	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	SAMEORIGIN
_browser_header.contentSecurityPolicy	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	1; mode=block
_browser_header.strictTransportSecurity	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	max-age=31536000; includeSubDomains
bruteForceProtected	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	false
permanentLockout	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	false
maxFailureWaitSeconds	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	900
minimumQuickLoginWaitSeconds	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	60
waitIncrementSeconds	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	60
quickLoginCheckMilliSeconds	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	1000
maxDeltaTimeSeconds	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	43200
failureFactor	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	30
defaultSignatureAlgorithm	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	RS256
offlineSessionMaxLifespanEnabled	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	false
offlineSessionMaxLifespan	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	5184000
actionTokenGeneratedByAdminLifespan	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	43200
actionTokenGeneratedByUserLifespan	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	300
oauth2DeviceCodeLifespan	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	600
oauth2DevicePollingInterval	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	5
webAuthnPolicyRpEntityName	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	keycloak
webAuthnPolicySignatureAlgorithms	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	ES256
webAuthnPolicyRpId	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	
webAuthnPolicyAttestationConveyancePreference	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyAuthenticatorAttachment	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyRequireResidentKey	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyUserVerificationRequirement	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyCreateTimeout	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	0
webAuthnPolicyAvoidSameAuthenticatorRegister	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	false
webAuthnPolicyRpEntityNamePasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	ES256
webAuthnPolicyRpIdPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	
webAuthnPolicyAttestationConveyancePreferencePasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyRequireResidentKeyPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	not specified
webAuthnPolicyCreateTimeoutPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	false
cibaBackchannelTokenDeliveryMode	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	poll
cibaExpiresIn	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	120
cibaInterval	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	5
cibaAuthRequestedUserHint	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	login_hint
parRequestUriLifespan	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
1fe32191-f201-4478-b052-d3f2fd3c61d1	jboss-logging
b1fffe98-6c87-4c74-9607-fb4b4c6f837d	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	1fe32191-f201-4478-b052-d3f2fd3c61d1
password	password	t	t	b1fffe98-6c87-4c74-9607-fb4b4c6f837d
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirect_uris (client_id, value) FROM stdin;
320cf5b2-3ee2-4217-960a-9bb316e187d8	/realms/master/account/*
2553be04-c600-4eb7-997f-40541b6d1711	/realms/master/account/*
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	/admin/master/console/*
cb8e206d-aed8-4b85-9cea-9bc7406a935c	/realms/Gamify-IT/account/*
5811e4e5-a6f7-4aac-8def-8a53bd91600d	/realms/Gamify-IT/account/*
740be63d-cd29-4660-892e-12ad842087d8	/admin/Gamify-IT/console/*
8fb05d82-5c4d-40f3-9bb3-8439e9612224	/*
f043013d-a770-4400-ac31-9f97cf5beee1	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
580b3877-9fda-476a-b269-e89dcb06bd1c	VERIFY_EMAIL	Verify Email	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	VERIFY_EMAIL	50
eabba776-8c45-479e-86f2-97e8b36c662b	UPDATE_PROFILE	Update Profile	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	UPDATE_PROFILE	40
fa52850f-b361-437f-8b4d-68d81cfe65f8	CONFIGURE_TOTP	Configure OTP	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	CONFIGURE_TOTP	10
bdc13058-7caa-416a-9bd2-1f1201370353	UPDATE_PASSWORD	Update Password	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	UPDATE_PASSWORD	30
1eae37c8-3f18-48b7-aeeb-bff47204e38d	terms_and_conditions	Terms and Conditions	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	f	terms_and_conditions	20
73b301a7-de3f-419d-a53c-eb28b1d1ed2a	update_user_locale	Update User Locale	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	update_user_locale	1000
dbebde56-2605-4400-9450-17c2116e7130	delete_account	Delete Account	1fe32191-f201-4478-b052-d3f2fd3c61d1	f	f	delete_account	60
ff3c74c2-932a-4b96-9cbd-a6269bd7e86c	webauthn-register	Webauthn Register	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	webauthn-register	70
38a1b2e2-9d69-4d32-873f-69f2c63e24c0	webauthn-register-passwordless	Webauthn Register Passwordless	1fe32191-f201-4478-b052-d3f2fd3c61d1	t	f	webauthn-register-passwordless	80
b727d9c2-299b-4a95-9e32-37977305c3b7	VERIFY_EMAIL	Verify Email	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	VERIFY_EMAIL	50
abc524df-e0e3-4efe-ada5-7fc0a988435e	UPDATE_PROFILE	Update Profile	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	UPDATE_PROFILE	40
94f24244-773d-4cf5-b1fd-a303c71dc268	CONFIGURE_TOTP	Configure OTP	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	CONFIGURE_TOTP	10
3b5fe8ad-b0e0-40ec-a062-6c53d204eda5	UPDATE_PASSWORD	Update Password	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	UPDATE_PASSWORD	30
687eb8e9-1793-429d-b715-29cba2b5acad	terms_and_conditions	Terms and Conditions	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f	f	terms_and_conditions	20
6b1449a8-7e6b-46ab-aa22-650cdb279791	update_user_locale	Update User Locale	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	update_user_locale	1000
68d98ebd-6cf8-4395-8304-f41951b04ce3	delete_account	Delete Account	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	f	f	delete_account	60
189fb027-bcd6-4033-9725-40249e3498e2	webauthn-register	Webauthn Register	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	webauthn-register	70
0fe4b7ab-98ba-4ede-8095-3a486f67e233	webauthn-register-passwordless	Webauthn Register Passwordless	b1fffe98-6c87-4c74-9607-fb4b4c6f837d	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	f	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
a4ebe3c3-468c-46fa-8cbf-e491f84cc968	manage	\N	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
a58d7c85-bd34-437e-92ee-c113170c63ff	view	\N	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
1e4b717b-24fe-44cd-9c82-8c8dadd7b611	manage-members	\N	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
ca8261d8-4759-48f7-a625-15e9a87317c7	view-members	\N	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
23992745-969c-43e2-b883-067eabe956fa	manage-membership	\N	eb0ad8ca-7cbf-4f33-9710-7b0c31ba7635	\N
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
dccd436d-009d-4b6c-9725-5dbfd794c994	ab94ef07-a9c1-4d49-aadd-05fc58cfc176	asdf	asdf
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
2553be04-c600-4eb7-997f-40541b6d1711	cc088c2b-ab75-4075-8154-1b8d3559a2b5
5811e4e5-a6f7-4aac-8def-8a53bd91600d	14102941-0bb3-4188-babf-a25a89f98b10
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
bbf1942a-aa33-486f-872f-80658bf9d274	\N	73d35c35-08d9-40a4-aa7f-633206d884f4	f	t	\N	\N	\N	1fe32191-f201-4478-b052-d3f2fd3c61d1	admin	1661607810285	\N	0
77451ff3-79c4-4503-8e46-869c377b593a	\N	b1e584eb-a5bd-4c08-82f4-0a54034046dc	f	t	\N			b1fffe98-6c87-4c74-9607-fb4b4c6f837d	max	1661608081348	\N	0
d188d062-5354-4547-928b-accc0591e01a	\N	65a75b81-2677-4267-805d-bfd042486f45	f	t	\N			b1fffe98-6c87-4c74-9607-fb4b4c6f837d	student	1661608112493	\N	0
c858aea9-a744-4709-a169-9df329fe4d95	\N	c0881a28-a1b5-448d-a7b6-6a6c092bd586	f	t	\N			b1fffe98-6c87-4c74-9607-fb4b4c6f837d	lecturer	1661769820489	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
444d2793-bdbc-4669-bf22-896d8ea78274	77451ff3-79c4-4503-8e46-869c377b593a
444d2793-bdbc-4669-bf22-896d8ea78274	d188d062-5354-4547-928b-accc0591e01a
3e88da54-c351-47dd-84c2-435c3bccd3ef	c858aea9-a744-4709-a169-9df329fe4d95
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
ecce056b-d965-47e2-aa1a-cea6be507fc4	bbf1942a-aa33-486f-872f-80658bf9d274
b6102d6a-e534-4c30-87c1-1b827a2aac4f	bbf1942a-aa33-486f-872f-80658bf9d274
8fef9af0-ce80-4d47-a3f3-0582c86bcc8d	bbf1942a-aa33-486f-872f-80658bf9d274
bff97cf3-3330-4649-91aa-a5766cea2d31	bbf1942a-aa33-486f-872f-80658bf9d274
5e774960-2096-4933-899a-29aac25418bc	bbf1942a-aa33-486f-872f-80658bf9d274
fb937fd1-2aed-4681-a4f6-37fe18c27b86	bbf1942a-aa33-486f-872f-80658bf9d274
0473f51d-fbdb-4b21-be61-c92b36bb8baa	bbf1942a-aa33-486f-872f-80658bf9d274
67d4ebd2-de57-477c-bf7d-a617f910117d	bbf1942a-aa33-486f-872f-80658bf9d274
3026ea8f-43a1-48c1-af27-145045c0b28c	bbf1942a-aa33-486f-872f-80658bf9d274
b948fc02-4daa-4745-bf1d-ecd1b35679ea	bbf1942a-aa33-486f-872f-80658bf9d274
715200fa-6098-4725-a09a-0fe7b328dd37	bbf1942a-aa33-486f-872f-80658bf9d274
fe089f9a-f7ee-43d8-980e-d76e36e3efce	bbf1942a-aa33-486f-872f-80658bf9d274
c17b2538-a890-4a19-987e-41a43334f8f1	bbf1942a-aa33-486f-872f-80658bf9d274
ff76e2d2-725a-4b45-ad1a-2d695799511b	bbf1942a-aa33-486f-872f-80658bf9d274
b683d667-eb01-42c7-b66b-de7d22483843	bbf1942a-aa33-486f-872f-80658bf9d274
bd0ab732-eede-4822-8e39-1f71e107edc0	bbf1942a-aa33-486f-872f-80658bf9d274
d0c913a5-31bc-4787-93d2-8b557c20a240	bbf1942a-aa33-486f-872f-80658bf9d274
48363041-ed48-4d77-abe0-ec0fb4804b62	bbf1942a-aa33-486f-872f-80658bf9d274
ea7053a1-33c7-48af-93b4-6f0e6cbb7ad6	bbf1942a-aa33-486f-872f-80658bf9d274
654ba425-fc4c-481b-b168-654e0c40c999	77451ff3-79c4-4503-8e46-869c377b593a
654ba425-fc4c-481b-b168-654e0c40c999	d188d062-5354-4547-928b-accc0591e01a
654ba425-fc4c-481b-b168-654e0c40c999	c858aea9-a744-4709-a169-9df329fe4d95
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
982e82ac-9f63-4105-86e3-e1f3afd3f0f4	+
740be63d-cd29-4660-892e-12ad842087d8	+
f043013d-a770-4400-ac31-9f97cf5beee1	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

