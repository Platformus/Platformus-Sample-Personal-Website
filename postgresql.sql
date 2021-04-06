--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-03-24 12:57:41

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
-- TOC entry 227 (class 1259 OID 18086)
-- Name: Classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Classes" (
    "Id" integer NOT NULL,
    "ClassId" integer,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "PluralizedName" text NOT NULL,
    "IsAbstract" boolean NOT NULL
);


ALTER TABLE public."Classes" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18084)
-- Name: Classes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Classes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Classes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 226
-- Name: Classes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Classes_Id_seq" OWNED BY public."Classes"."Id";


--
-- TOC entry 259 (class 1259 OID 18390)
-- Name: CompletedFields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompletedFields" (
    "Id" integer NOT NULL,
    "CompletedFormId" integer NOT NULL,
    "FieldId" integer NOT NULL,
    "Value" text
);


ALTER TABLE public."CompletedFields" OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 18388)
-- Name: CompletedFields_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CompletedFields_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CompletedFields_Id_seq" OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 258
-- Name: CompletedFields_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CompletedFields_Id_seq" OWNED BY public."CompletedFields"."Id";


--
-- TOC entry 257 (class 1259 OID 18377)
-- Name: CompletedForms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompletedForms" (
    "Id" integer NOT NULL,
    "FormId" integer NOT NULL,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."CompletedForms" OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18375)
-- Name: CompletedForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CompletedForms_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CompletedForms_Id_seq" OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 256
-- Name: CompletedForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CompletedForms_Id_seq" OWNED BY public."CompletedForms"."Id";


--
-- TOC entry 213 (class 1259 OID 17980)
-- Name: Configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Configurations" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public."Configurations" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17978)
-- Name: Configurations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Configurations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Configurations_Id_seq" OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 212
-- Name: Configurations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Configurations_Id_seq" OWNED BY public."Configurations"."Id";


--
-- TOC entry 203 (class 1259 OID 17896)
-- Name: CredentialTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CredentialTypes" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."CredentialTypes" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17894)
-- Name: CredentialTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CredentialTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CredentialTypes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 202
-- Name: CredentialTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CredentialTypes_Id_seq" OWNED BY public."CredentialTypes"."Id";


--
-- TOC entry 205 (class 1259 OID 17907)
-- Name: Credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Credentials" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "CredentialTypeId" integer NOT NULL,
    "Identifier" text NOT NULL,
    "Secret" text,
    "Extra" text
);


ALTER TABLE public."Credentials" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17905)
-- Name: Credentials_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Credentials_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Credentials_Id_seq" OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 204
-- Name: Credentials_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Credentials_Id_seq" OWNED BY public."Credentials"."Id";


--
-- TOC entry 216 (class 1259 OID 18005)
-- Name: Cultures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cultures" (
    "Id" text NOT NULL,
    "Name" text NOT NULL,
    "IsNeutral" boolean NOT NULL,
    "IsFrontendDefault" boolean NOT NULL,
    "IsBackendDefault" boolean NOT NULL
);


ALTER TABLE public."Cultures" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18070)
-- Name: DataSources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSources" (
    "Id" integer NOT NULL,
    "EndpointId" integer NOT NULL,
    "Code" text NOT NULL,
    "CSharpClassName" text NOT NULL,
    "Parameters" text
);


ALTER TABLE public."DataSources" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18068)
-- Name: DataSources_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSources_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSources_Id_seq" OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 224
-- Name: DataSources_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSources_Id_seq" OWNED BY public."DataSources"."Id";


--
-- TOC entry 237 (class 1259 OID 18176)
-- Name: DataTypeParameterValues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataTypeParameterValues" (
    "Id" integer NOT NULL,
    "DataTypeParameterId" integer NOT NULL,
    "MemberId" integer NOT NULL,
    "Value" text NOT NULL
);


ALTER TABLE public."DataTypeParameterValues" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18174)
-- Name: DataTypeParameterValues_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataTypeParameterValues_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataTypeParameterValues_Id_seq" OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 236
-- Name: DataTypeParameterValues_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataTypeParameterValues_Id_seq" OWNED BY public."DataTypeParameterValues"."Id";


--
-- TOC entry 233 (class 1259 OID 18129)
-- Name: DataTypeParameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataTypeParameters" (
    "Id" integer NOT NULL,
    "DataTypeId" integer NOT NULL,
    "JavaScriptEditorClassName" text NOT NULL,
    "Code" text NOT NULL,
    "Name" text
);


ALTER TABLE public."DataTypeParameters" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18127)
-- Name: DataTypeParameters_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataTypeParameters_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataTypeParameters_Id_seq" OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 232
-- Name: DataTypeParameters_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataTypeParameters_Id_seq" OWNED BY public."DataTypeParameters"."Id";


--
-- TOC entry 231 (class 1259 OID 18118)
-- Name: DataTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataTypes" (
    "Id" integer NOT NULL,
    "StorageDataType" text NOT NULL,
    "JavaScriptEditorClassName" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."DataTypes" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18116)
-- Name: DataTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataTypes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 230
-- Name: DataTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataTypes_Id_seq" OWNED BY public."DataTypes"."Id";


--
-- TOC entry 218 (class 1259 OID 18015)
-- Name: Dictionaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dictionaries" (
    "Id" integer NOT NULL
);


ALTER TABLE public."Dictionaries" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18013)
-- Name: Dictionaries_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Dictionaries_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Dictionaries_Id_seq" OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 217
-- Name: Dictionaries_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Dictionaries_Id_seq" OWNED BY public."Dictionaries"."Id";


--
-- TOC entry 223 (class 1259 OID 18053)
-- Name: EndpointPermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EndpointPermissions" (
    "EndpointId" integer NOT NULL,
    "PermissionId" integer NOT NULL
);


ALTER TABLE public."EndpointPermissions" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18044)
-- Name: Endpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Endpoints" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "UrlTemplate" text,
    "Position" integer,
    "DisallowAnonymous" boolean NOT NULL,
    "SignInUrl" text,
    "ResponseCacheCSharpClassName" text,
    "CSharpClassName" text NOT NULL,
    "Parameters" text
);


ALTER TABLE public."Endpoints" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18042)
-- Name: Endpoints_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Endpoints_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Endpoints_Id_seq" OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 221
-- Name: Endpoints_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Endpoints_Id_seq" OWNED BY public."Endpoints"."Id";


--
-- TOC entry 255 (class 1259 OID 18359)
-- Name: FieldOptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FieldOptions" (
    "Id" integer NOT NULL,
    "FieldId" integer NOT NULL,
    "ValueId" integer NOT NULL,
    "Position" integer
);


ALTER TABLE public."FieldOptions" OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18357)
-- Name: FieldOptions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FieldOptions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FieldOptions_Id_seq" OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 254
-- Name: FieldOptions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FieldOptions_Id_seq" OWNED BY public."FieldOptions"."Id";


--
-- TOC entry 251 (class 1259 OID 18322)
-- Name: FieldTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FieldTypes" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer,
    "ValidatorCSharpClassName" text
);


ALTER TABLE public."FieldTypes" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18320)
-- Name: FieldTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FieldTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FieldTypes_Id_seq" OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 250
-- Name: FieldTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FieldTypes_Id_seq" OWNED BY public."FieldTypes"."Id";


--
-- TOC entry 253 (class 1259 OID 18333)
-- Name: Fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fields" (
    "Id" integer NOT NULL,
    "FormId" integer NOT NULL,
    "FieldTypeId" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "IsRequired" boolean NOT NULL,
    "MaxLength" integer,
    "Position" integer
);


ALTER TABLE public."Fields" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18331)
-- Name: Fields_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Fields_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Fields_Id_seq" OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 252
-- Name: Fields_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Fields_Id_seq" OWNED BY public."Fields"."Id";


--
-- TOC entry 261 (class 1259 OID 18411)
-- Name: Files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Files" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Size" bigint NOT NULL
);


ALTER TABLE public."Files" OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 18409)
-- Name: Files_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Files_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Files_Id_seq" OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 260
-- Name: Files_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Files_Id_seq" OWNED BY public."Files"."Id";


--
-- TOC entry 249 (class 1259 OID 18301)
-- Name: Forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Forms" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL,
    "SubmitButtonTitleId" integer NOT NULL,
    "ProduceCompletedForms" boolean NOT NULL,
    "CSharpClassName" text NOT NULL,
    "Parameters" text
);


ALTER TABLE public."Forms" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18299)
-- Name: Forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Forms_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Forms_Id_seq" OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 248
-- Name: Forms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Forms_Id_seq" OWNED BY public."Forms"."Id";


--
-- TOC entry 220 (class 1259 OID 18023)
-- Name: Localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Localizations" (
    "Id" integer NOT NULL,
    "DictionaryId" integer NOT NULL,
    "CultureId" text NOT NULL,
    "Value" text
);


ALTER TABLE public."Localizations" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18021)
-- Name: Localizations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Localizations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Localizations_Id_seq" OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 219
-- Name: Localizations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Localizations_Id_seq" OWNED BY public."Localizations"."Id";


--
-- TOC entry 235 (class 1259 OID 18145)
-- Name: Members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Members" (
    "Id" integer NOT NULL,
    "ClassId" integer NOT NULL,
    "TabId" integer,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer,
    "PropertyDataTypeId" integer,
    "IsPropertyLocalizable" boolean,
    "IsPropertyVisibleInList" boolean,
    "RelationClassId" integer,
    "IsRelationSingleParent" boolean,
    "MinRelatedObjectsNumber" integer,
    "MaxRelatedObjectsNumber" integer
);


ALTER TABLE public."Members" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18143)
-- Name: Members_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Members_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Members_Id_seq" OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 234
-- Name: Members_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Members_Id_seq" OWNED BY public."Members"."Id";


--
-- TOC entry 247 (class 1259 OID 18275)
-- Name: MenuItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MenuItems" (
    "Id" integer NOT NULL,
    "MenuId" integer,
    "MenuItemId" integer,
    "NameId" integer NOT NULL,
    "Url" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."MenuItems" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18273)
-- Name: MenuItems_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MenuItems_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MenuItems_Id_seq" OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 246
-- Name: MenuItems_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MenuItems_Id_seq" OWNED BY public."MenuItems"."Id";


--
-- TOC entry 245 (class 1259 OID 18259)
-- Name: Menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Menus" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "NameId" integer NOT NULL
);


ALTER TABLE public."Menus" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18257)
-- Name: Menus_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Menus_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Menus_Id_seq" OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 244
-- Name: Menus_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Menus_Id_seq" OWNED BY public."Menus"."Id";


--
-- TOC entry 239 (class 1259 OID 18197)
-- Name: Objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Objects" (
    "Id" integer NOT NULL,
    "ClassId" integer NOT NULL
);


ALTER TABLE public."Objects" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18195)
-- Name: Objects_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Objects_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Objects_Id_seq" OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 238
-- Name: Objects_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Objects_Id_seq" OWNED BY public."Objects"."Id";


--
-- TOC entry 210 (class 1259 OID 17954)
-- Name: Permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permissions" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Permissions" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17952)
-- Name: Permissions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Permissions_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permissions_Id_seq" OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 209
-- Name: Permissions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Permissions_Id_seq" OWNED BY public."Permissions"."Id";


--
-- TOC entry 241 (class 1259 OID 18210)
-- Name: Properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Properties" (
    "Id" integer NOT NULL,
    "ObjectId" integer NOT NULL,
    "MemberId" integer NOT NULL,
    "IntegerValue" integer,
    "DecimalValue" numeric,
    "StringValueId" integer,
    "DateTimeValue" timestamp without time zone
);


ALTER TABLE public."Properties" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18208)
-- Name: Properties_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Properties_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Properties_Id_seq" OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 240
-- Name: Properties_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Properties_Id_seq" OWNED BY public."Properties"."Id";


--
-- TOC entry 243 (class 1259 OID 18236)
-- Name: Relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Relations" (
    "Id" integer NOT NULL,
    "MemberId" integer NOT NULL,
    "PrimaryId" integer NOT NULL,
    "ForeignId" integer NOT NULL
);


ALTER TABLE public."Relations" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18234)
-- Name: Relations_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Relations_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Relations_Id_seq" OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 242
-- Name: Relations_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Relations_Id_seq" OWNED BY public."Relations"."Id";


--
-- TOC entry 211 (class 1259 OID 17963)
-- Name: RolePermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolePermissions" (
    "RoleId" integer NOT NULL,
    "PermissionId" integer NOT NULL
);


ALTER TABLE public."RolePermissions" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17928)
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    "Id" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17926)
-- Name: Roles_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Roles_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_Id_seq" OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 206
-- Name: Roles_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Roles_Id_seq" OWNED BY public."Roles"."Id";


--
-- TOC entry 229 (class 1259 OID 18102)
-- Name: Tabs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tabs" (
    "Id" integer NOT NULL,
    "ClassId" integer NOT NULL,
    "Name" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Tabs" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18100)
-- Name: Tabs_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tabs_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tabs_Id_seq" OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 228
-- Name: Tabs_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tabs_Id_seq" OWNED BY public."Tabs"."Id";


--
-- TOC entry 208 (class 1259 OID 17937)
-- Name: UserRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserRoles" (
    "UserId" integer NOT NULL,
    "RoleId" integer NOT NULL
);


ALTER TABLE public."UserRoles" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17885)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Created" timestamp without time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17883)
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_Id_seq" OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 200
-- Name: Users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_Id_seq" OWNED BY public."Users"."Id";


--
-- TOC entry 215 (class 1259 OID 17991)
-- Name: Variables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Variables" (
    "Id" integer NOT NULL,
    "ConfigurationId" integer NOT NULL,
    "Code" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text NOT NULL,
    "Position" integer
);


ALTER TABLE public."Variables" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17989)
-- Name: Variables_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Variables_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Variables_Id_seq" OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 214
-- Name: Variables_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Variables_Id_seq" OWNED BY public."Variables"."Id";


--
-- TOC entry 3070 (class 2604 OID 18089)
-- Name: Classes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Classes" ALTER COLUMN "Id" SET DEFAULT nextval('public."Classes_Id_seq"'::regclass);


--
-- TOC entry 3086 (class 2604 OID 18393)
-- Name: CompletedFields Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields" ALTER COLUMN "Id" SET DEFAULT nextval('public."CompletedFields_Id_seq"'::regclass);


--
-- TOC entry 3085 (class 2604 OID 18380)
-- Name: CompletedForms Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedForms" ALTER COLUMN "Id" SET DEFAULT nextval('public."CompletedForms_Id_seq"'::regclass);


--
-- TOC entry 3064 (class 2604 OID 17983)
-- Name: Configurations Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configurations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Configurations_Id_seq"'::regclass);


--
-- TOC entry 3060 (class 2604 OID 17899)
-- Name: CredentialTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CredentialTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."CredentialTypes_Id_seq"'::regclass);


--
-- TOC entry 3061 (class 2604 OID 17910)
-- Name: Credentials Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials" ALTER COLUMN "Id" SET DEFAULT nextval('public."Credentials_Id_seq"'::regclass);


--
-- TOC entry 3069 (class 2604 OID 18073)
-- Name: DataSources Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSources" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataSources_Id_seq"'::regclass);


--
-- TOC entry 3075 (class 2604 OID 18179)
-- Name: DataTypeParameterValues Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterValues" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataTypeParameterValues_Id_seq"'::regclass);


--
-- TOC entry 3073 (class 2604 OID 18132)
-- Name: DataTypeParameters Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameters" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataTypeParameters_Id_seq"'::regclass);


--
-- TOC entry 3072 (class 2604 OID 18121)
-- Name: DataTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataTypes_Id_seq"'::regclass);


--
-- TOC entry 3066 (class 2604 OID 18018)
-- Name: Dictionaries Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dictionaries" ALTER COLUMN "Id" SET DEFAULT nextval('public."Dictionaries_Id_seq"'::regclass);


--
-- TOC entry 3068 (class 2604 OID 18047)
-- Name: Endpoints Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Endpoints" ALTER COLUMN "Id" SET DEFAULT nextval('public."Endpoints_Id_seq"'::regclass);


--
-- TOC entry 3084 (class 2604 OID 18362)
-- Name: FieldOptions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions" ALTER COLUMN "Id" SET DEFAULT nextval('public."FieldOptions_Id_seq"'::regclass);


--
-- TOC entry 3082 (class 2604 OID 18325)
-- Name: FieldTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."FieldTypes_Id_seq"'::regclass);


--
-- TOC entry 3083 (class 2604 OID 18336)
-- Name: Fields Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields" ALTER COLUMN "Id" SET DEFAULT nextval('public."Fields_Id_seq"'::regclass);


--
-- TOC entry 3087 (class 2604 OID 18414)
-- Name: Files Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files" ALTER COLUMN "Id" SET DEFAULT nextval('public."Files_Id_seq"'::regclass);


--
-- TOC entry 3081 (class 2604 OID 18304)
-- Name: Forms Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms" ALTER COLUMN "Id" SET DEFAULT nextval('public."Forms_Id_seq"'::regclass);


--
-- TOC entry 3067 (class 2604 OID 18026)
-- Name: Localizations Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Localizations_Id_seq"'::regclass);


--
-- TOC entry 3074 (class 2604 OID 18148)
-- Name: Members Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members" ALTER COLUMN "Id" SET DEFAULT nextval('public."Members_Id_seq"'::regclass);


--
-- TOC entry 3080 (class 2604 OID 18278)
-- Name: MenuItems Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems" ALTER COLUMN "Id" SET DEFAULT nextval('public."MenuItems_Id_seq"'::regclass);


--
-- TOC entry 3079 (class 2604 OID 18262)
-- Name: Menus Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menus" ALTER COLUMN "Id" SET DEFAULT nextval('public."Menus_Id_seq"'::regclass);


--
-- TOC entry 3076 (class 2604 OID 18200)
-- Name: Objects Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects" ALTER COLUMN "Id" SET DEFAULT nextval('public."Objects_Id_seq"'::regclass);


--
-- TOC entry 3063 (class 2604 OID 17957)
-- Name: Permissions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions" ALTER COLUMN "Id" SET DEFAULT nextval('public."Permissions_Id_seq"'::regclass);


--
-- TOC entry 3077 (class 2604 OID 18213)
-- Name: Properties Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties" ALTER COLUMN "Id" SET DEFAULT nextval('public."Properties_Id_seq"'::regclass);


--
-- TOC entry 3078 (class 2604 OID 18239)
-- Name: Relations Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations" ALTER COLUMN "Id" SET DEFAULT nextval('public."Relations_Id_seq"'::regclass);


--
-- TOC entry 3062 (class 2604 OID 17931)
-- Name: Roles Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN "Id" SET DEFAULT nextval('public."Roles_Id_seq"'::regclass);


--
-- TOC entry 3071 (class 2604 OID 18105)
-- Name: Tabs Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tabs" ALTER COLUMN "Id" SET DEFAULT nextval('public."Tabs_Id_seq"'::regclass);


--
-- TOC entry 3059 (class 2604 OID 17888)
-- Name: Users Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "Id" SET DEFAULT nextval('public."Users_Id_seq"'::regclass);


--
-- TOC entry 3065 (class 2604 OID 17994)
-- Name: Variables Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variables" ALTER COLUMN "Id" SET DEFAULT nextval('public."Variables_Id_seq"'::regclass);


--
-- TOC entry 3353 (class 0 OID 18086)
-- Dependencies: 227
-- Data for Name: Classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Classes" ("Id", "ClassId", "Code", "Name", "PluralizedName", "IsAbstract") VALUES (1, NULL, 'Page', 'Page', 'Pages', true);
INSERT INTO public."Classes" ("Id", "ClassId", "Code", "Name", "PluralizedName", "IsAbstract") VALUES (2, 1, 'RegularPage', 'Regular Page', 'Regular Pages', false);


--
-- TOC entry 3385 (class 0 OID 18390)
-- Dependencies: 259
-- Data for Name: CompletedFields; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3383 (class 0 OID 18377)
-- Dependencies: 257
-- Data for Name: CompletedForms; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3339 (class 0 OID 17980)
-- Dependencies: 213
-- Data for Name: Configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Configurations" ("Id", "Code", "Name") VALUES (1, 'Email', 'Email');
INSERT INTO public."Configurations" ("Id", "Code", "Name") VALUES (2, 'Globalization', 'Globalization');


--
-- TOC entry 3329 (class 0 OID 17896)
-- Dependencies: 203
-- Data for Name: CredentialTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."CredentialTypes" ("Id", "Code", "Name", "Position") VALUES (1, 'Email', 'Email', 1);


--
-- TOC entry 3331 (class 0 OID 17907)
-- Dependencies: 205
-- Data for Name: Credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Credentials" ("Id", "UserId", "CredentialTypeId", "Identifier", "Secret", "Extra") VALUES (1, 1, 1, 'admin@platformus.net', '8lE3xN2Ijiv/Y/aIGwaZLrbcqrt/1jDmzPTdudKbVD0=', '0O/ZGwhScZRGbsmiUEckOg==');


--
-- TOC entry 3342 (class 0 OID 18005)
-- Dependencies: 216
-- Data for Name: Cultures; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('__', 'Neutral', true, false, false);
INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('en', 'English', false, true, true);
INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('ru', 'Русский', false, false, false);
INSERT INTO public."Cultures" ("Id", "Name", "IsNeutral", "IsFrontendDefault", "IsBackendDefault") VALUES ('uk', 'Українська', false, false, false);


--
-- TOC entry 3351 (class 0 OID 18070)
-- Dependencies: 225
-- Data for Name: DataSources; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataSources" ("Id", "EndpointId", "Code", "CSharpClassName", "Parameters") VALUES (1, 1, 'Page', 'Platformus.Website.Frontend.DataSources.PageObjectDataSource', NULL);
INSERT INTO public."DataSources" ("Id", "EndpointId", "Code", "CSharpClassName", "Parameters") VALUES (2, 2, 'Page', 'Platformus.Website.Frontend.DataSources.PageObjectDataSource', NULL);


--
-- TOC entry 3363 (class 0 OID 18176)
-- Dependencies: 237
-- Data for Name: DataTypeParameterValues; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (1, 1, 1, 'true');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (2, 2, 1, '128');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (3, 1, 3, 'false');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (4, 2, 3, '128');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (5, 1, 4, 'false');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (6, 2, 4, '512');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (7, 1, 5, 'false');
INSERT INTO public."DataTypeParameterValues" ("Id", "DataTypeParameterId", "MemberId", "Value") VALUES (8, 2, 5, '256');


--
-- TOC entry 3359 (class 0 OID 18129)
-- Dependencies: 233
-- Data for Name: DataTypeParameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (1, 1, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (2, 1, 'numericTextBox', 'MaxLength', 'Max length');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (3, 2, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (4, 2, 'numericTextBox', 'MaxLength', 'Max length');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (5, 7, 'checkbox', 'IsRequired', 'Is required');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (6, 8, 'numericTextBox', 'Width', 'Width');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (7, 8, 'numericTextBox', 'Height', 'Height');
INSERT INTO public."DataTypeParameters" ("Id", "DataTypeId", "JavaScriptEditorClassName", "Code", "Name") VALUES (8, 9, 'textBox', 'Mode', 'Mode');


--
-- TOC entry 3357 (class 0 OID 18118)
-- Dependencies: 231
-- Data for Name: DataTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (1, 'string', 'singleLinePlainText', 'Single line plain text', 1);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (2, 'string', 'multilinePlainText', 'Multiline plain text', 2);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (3, 'string', 'html', 'Html', 3);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (4, 'integer', 'integerNumber', 'Integer number', 4);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (5, 'decimal', 'decimalNumber', 'Decimal number', 5);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (6, 'integer', 'booleanFlag', 'Boolean flag', 6);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (7, 'datetime', 'date', 'Date', 7);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (8, 'string', 'image', 'Image', 8);
INSERT INTO public."DataTypes" ("Id", "StorageDataType", "JavaScriptEditorClassName", "Name", "Position") VALUES (9, 'string', 'sourceCode', 'Source code', 9);


--
-- TOC entry 3344 (class 0 OID 18015)
-- Dependencies: 218
-- Data for Name: Dictionaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Dictionaries" ("Id") VALUES (1);
INSERT INTO public."Dictionaries" ("Id") VALUES (2);
INSERT INTO public."Dictionaries" ("Id") VALUES (3);
INSERT INTO public."Dictionaries" ("Id") VALUES (4);
INSERT INTO public."Dictionaries" ("Id") VALUES (5);
INSERT INTO public."Dictionaries" ("Id") VALUES (6);
INSERT INTO public."Dictionaries" ("Id") VALUES (7);
INSERT INTO public."Dictionaries" ("Id") VALUES (8);
INSERT INTO public."Dictionaries" ("Id") VALUES (9);
INSERT INTO public."Dictionaries" ("Id") VALUES (10);
INSERT INTO public."Dictionaries" ("Id") VALUES (11);
INSERT INTO public."Dictionaries" ("Id") VALUES (12);
INSERT INTO public."Dictionaries" ("Id") VALUES (13);
INSERT INTO public."Dictionaries" ("Id") VALUES (14);
INSERT INTO public."Dictionaries" ("Id") VALUES (15);
INSERT INTO public."Dictionaries" ("Id") VALUES (16);
INSERT INTO public."Dictionaries" ("Id") VALUES (17);
INSERT INTO public."Dictionaries" ("Id") VALUES (18);
INSERT INTO public."Dictionaries" ("Id") VALUES (19);
INSERT INTO public."Dictionaries" ("Id") VALUES (20);
INSERT INTO public."Dictionaries" ("Id") VALUES (21);
INSERT INTO public."Dictionaries" ("Id") VALUES (22);
INSERT INTO public."Dictionaries" ("Id") VALUES (23);
INSERT INTO public."Dictionaries" ("Id") VALUES (24);


--
-- TOC entry 3349 (class 0 OID 18053)
-- Dependencies: 223
-- Data for Name: EndpointPermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3348 (class 0 OID 18044)
-- Dependencies: 222
-- Data for Name: Endpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Endpoints" ("Id", "Name", "UrlTemplate", "Position", "DisallowAnonymous", "SignInUrl", "ResponseCacheCSharpClassName", "CSharpClassName", "Parameters") VALUES (1, 'Default', '{*url}', 1000, false, NULL, NULL, 'Platformus.Website.Frontend.DefaultEndpoint', 'ViewName=RegularPage');
INSERT INTO public."Endpoints" ("Id", "Name", "UrlTemplate", "Position", "DisallowAnonymous", "SignInUrl", "ResponseCacheCSharpClassName", "CSharpClassName", "Parameters") VALUES (2, 'Contacts', 'contacts', 10, false, NULL, NULL, 'Platformus.Website.Frontend.DefaultEndpoint', 'ViewName=ContactsPage');


--
-- TOC entry 3381 (class 0 OID 18359)
-- Dependencies: 255
-- Data for Name: FieldOptions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3377 (class 0 OID 18322)
-- Dependencies: 251
-- Data for Name: FieldTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (1, 'TextBox', 'Text box', 1, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (2, 'TextArea', 'Text area', 2, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (3, 'Checkbox', 'Checkbox', 3, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (4, 'RadioButtonList', 'Radio button list', 4, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (5, 'DropDownList', 'Drop down list', 5, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (6, 'FileUpload', 'File upload', 6, NULL);
INSERT INTO public."FieldTypes" ("Id", "Code", "Name", "Position", "ValidatorCSharpClassName") VALUES (7, 'ReCAPTCHA', 'ReCAPTCHA', 7, 'Platformus.Website.Frontend.FormHandlers.ReCaptchaFieldValidator');


--
-- TOC entry 3379 (class 0 OID 18333)
-- Dependencies: 253
-- Data for Name: Fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Fields" ("Id", "FormId", "FieldTypeId", "Code", "NameId", "IsRequired", "MaxLength", "Position") VALUES (1, 1, 1, 'Name', 7, true, NULL, 10);
INSERT INTO public."Fields" ("Id", "FormId", "FieldTypeId", "Code", "NameId", "IsRequired", "MaxLength", "Position") VALUES (2, 1, 1, 'Email', 8, true, NULL, 20);
INSERT INTO public."Fields" ("Id", "FormId", "FieldTypeId", "Code", "NameId", "IsRequired", "MaxLength", "Position") VALUES (3, 1, 2, 'Message', 9, true, NULL, 30);


--
-- TOC entry 3387 (class 0 OID 18411)
-- Dependencies: 261
-- Data for Name: Files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3375 (class 0 OID 18301)
-- Dependencies: 249
-- Data for Name: Forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Forms" ("Id", "Code", "NameId", "SubmitButtonTitleId", "ProduceCompletedForms", "CSharpClassName", "Parameters") VALUES (1, 'Feedback', 5, 6, true, 'Platformus.Website.Frontend.FormHandlers.EmailFormHandler', 'RecipientEmails=test@test.com;RedirectUrl=/contacts');


--
-- TOC entry 3346 (class 0 OID 18023)
-- Dependencies: 220
-- Data for Name: Localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (1, 1, 'en', 'Main');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (2, 1, 'ru', 'Главное');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (3, 1, 'uk', 'Головне');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (4, 2, 'uk', 'Головна');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (5, 2, 'ru', 'Главная');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (6, 2, 'en', 'Home');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (7, 3, 'uk', 'Про мене');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (8, 3, 'ru', 'Обо мне');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (9, 3, 'en', 'About me');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (10, 4, 'uk', 'Контакти');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (11, 4, 'ru', 'Контакты');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (12, 4, 'en', 'Contacts');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (13, 5, 'uk', 'Зворотний зв’язок');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (14, 5, 'ru', 'Обратная связь');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (15, 5, 'en', 'Feedback');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (16, 6, 'en', 'Submit');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (17, 6, 'ru', 'Отправить');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (18, 6, 'uk', 'Надіслати');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (19, 7, 'uk', 'Ваше ім’я');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (20, 7, 'ru', 'Ваше имя');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (21, 7, 'en', 'Your name');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (22, 8, 'uk', 'Ваша електронна пошта');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (23, 8, 'ru', 'Ваша электронная почта');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (24, 8, 'en', 'Your email');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (25, 9, 'uk', 'Ваше повідомлення');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (26, 9, 'ru', 'Ваше сообщение');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (27, 9, 'en', 'Your message');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (28, 10, '__', '/');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (29, 11, 'uk', '<h1>Ваш персональний веб-сайт</h1><p>Вітаємо! Це ваш персональний веб-сайт, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (30, 11, 'ru', '<h1>Ваш персональный веб-сайт</h1><p>Здравствуйте! Это ваш персональный веб-сайт, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (31, 11, 'en', '<h1>Your Personal Website</h1><p>Hello! This is your personal website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (32, 12, 'uk', 'Ваш персональний веб-сайт');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (33, 12, 'ru', 'Ваш персональный веб-сайт');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (34, 12, 'en', 'Your Personal Website');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (35, 13, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (36, 13, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (37, 13, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (38, 14, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (39, 14, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (40, 14, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (41, 15, '__', '/about-me');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (42, 16, 'uk', '<h1>Про мене</h1><p>Розкажіть про себе в кількох словах. Ви можете додати сюди фотографії або відео.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (43, 16, 'ru', '<h1>Обо мне</h1><p>Расскажите о себе в нескольких словах. Вы можете добавить сюда фотографии или видео.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (44, 16, 'en', '<h1>About Me</h1><p>Tell us about yourself in a few words. You can add photos or videos here.</p>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (45, 17, 'uk', 'Про мене');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (46, 17, 'ru', 'Обо мне');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (47, 17, 'en', 'About Me');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (48, 18, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (49, 18, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (50, 18, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (51, 19, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (52, 19, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (53, 19, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (54, 20, '__', '/contacts');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (55, 21, 'uk', '<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (56, 21, 'ru', '<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (57, 21, 'en', '<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (58, 22, 'uk', 'Контакти');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (59, 22, 'ru', 'Контакты');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (60, 22, 'en', 'Contacts');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (61, 23, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (62, 23, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (63, 23, 'en', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (64, 24, 'uk', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (65, 24, 'ru', '');
INSERT INTO public."Localizations" ("Id", "DictionaryId", "CultureId", "Value") VALUES (66, 24, 'en', '');


--
-- TOC entry 3361 (class 0 OID 18145)
-- Dependencies: 235
-- Data for Name: Members; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (1, 1, NULL, 'Url', 'URL', 1, 1, false, true, NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (2, 1, NULL, 'Content', 'Content', 10, 3, true, false, NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (3, 1, 1, 'Title', 'Title', 1000, 1, true, false, NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (4, 1, 1, 'MetaDescription', 'META description', 1010, 1, true, false, NULL, NULL, NULL, NULL);
INSERT INTO public."Members" ("Id", "ClassId", "TabId", "Code", "Name", "Position", "PropertyDataTypeId", "IsPropertyLocalizable", "IsPropertyVisibleInList", "RelationClassId", "IsRelationSingleParent", "MinRelatedObjectsNumber", "MaxRelatedObjectsNumber") VALUES (5, 1, 1, 'MetaKeywords', 'META keywords', 1020, 1, true, false, NULL, NULL, NULL, NULL);


--
-- TOC entry 3373 (class 0 OID 18275)
-- Dependencies: 247
-- Data for Name: MenuItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MenuItems" ("Id", "MenuId", "MenuItemId", "NameId", "Url", "Position") VALUES (1, 1, NULL, 2, '/', 10);
INSERT INTO public."MenuItems" ("Id", "MenuId", "MenuItemId", "NameId", "Url", "Position") VALUES (2, 1, NULL, 3, '/about-me', 20);
INSERT INTO public."MenuItems" ("Id", "MenuId", "MenuItemId", "NameId", "Url", "Position") VALUES (3, 1, NULL, 4, '/contacts', 30);


--
-- TOC entry 3371 (class 0 OID 18259)
-- Dependencies: 245
-- Data for Name: Menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Menus" ("Id", "Code", "NameId") VALUES (1, 'Main', 1);


--
-- TOC entry 3365 (class 0 OID 18197)
-- Dependencies: 239
-- Data for Name: Objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Objects" ("Id", "ClassId") VALUES (1, 2);
INSERT INTO public."Objects" ("Id", "ClassId") VALUES (2, 2);
INSERT INTO public."Objects" ("Id", "ClassId") VALUES (3, 2);


--
-- TOC entry 3336 (class 0 OID 17954)
-- Dependencies: 210
-- Data for Name: Permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (1, 'DoAnything', 'Do anything', 100);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (2, 'ManagePermissions', 'Manage permissions', 200);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (3, 'ManageRoles', 'Manage roles', 300);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (4, 'ManageUsers', 'Manage users', 400);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (5, 'ManageConfigurations', 'Manage configurations', 500);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (6, 'ManageCultures', 'Manage cultures', 600);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (7, 'ManageEndpoints', 'Manage endpoints', 700);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (8, 'ManageObjects', 'Manage objects', 800);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (9, 'ManageDataTypes', 'Manage data types', 900);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (10, 'ManageClasses', 'Manage classes', 1000);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (11, 'ManageMenus', 'Manage menus', 1100);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (12, 'ManageForms', 'Manage forms', 1200);
INSERT INTO public."Permissions" ("Id", "Code", "Name", "Position") VALUES (13, 'ManageFileManager', 'Manage file manager', 1300);


--
-- TOC entry 3367 (class 0 OID 18210)
-- Dependencies: 241
-- Data for Name: Properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (1, 1, 1, NULL, NULL, 10, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (2, 1, 2, NULL, NULL, 11, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (3, 1, 3, NULL, NULL, 12, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (4, 1, 4, NULL, NULL, 13, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (5, 1, 5, NULL, NULL, 14, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (6, 2, 1, NULL, NULL, 15, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (7, 2, 2, NULL, NULL, 16, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (8, 2, 3, NULL, NULL, 17, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (9, 2, 4, NULL, NULL, 18, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (10, 2, 5, NULL, NULL, 19, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (11, 3, 1, NULL, NULL, 20, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (12, 3, 2, NULL, NULL, 21, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (13, 3, 3, NULL, NULL, 22, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (14, 3, 4, NULL, NULL, 23, NULL);
INSERT INTO public."Properties" ("Id", "ObjectId", "MemberId", "IntegerValue", "DecimalValue", "StringValueId", "DateTimeValue") VALUES (15, 3, 5, NULL, NULL, 24, NULL);


--
-- TOC entry 3369 (class 0 OID 18236)
-- Dependencies: 243
-- Data for Name: Relations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3337 (class 0 OID 17963)
-- Dependencies: 211
-- Data for Name: RolePermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (1, 1);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (2, 1);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 8);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 11);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 12);
INSERT INTO public."RolePermissions" ("RoleId", "PermissionId") VALUES (3, 13);


--
-- TOC entry 3333 (class 0 OID 17928)
-- Dependencies: 207
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Roles" ("Id", "Code", "Name", "Position") VALUES (1, 'Developer', 'Developer', 100);
INSERT INTO public."Roles" ("Id", "Code", "Name", "Position") VALUES (2, 'Administrator', 'Administrator', 200);
INSERT INTO public."Roles" ("Id", "Code", "Name", "Position") VALUES (3, 'ContentManager', 'Content manager', 300);


--
-- TOC entry 3355 (class 0 OID 18102)
-- Dependencies: 229
-- Data for Name: Tabs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tabs" ("Id", "ClassId", "Name", "Position") VALUES (1, 1, 'SEO', 100);


--
-- TOC entry 3334 (class 0 OID 17937)
-- Dependencies: 208
-- Data for Name: UserRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."UserRoles" ("UserId", "RoleId") VALUES (1, 1);
INSERT INTO public."UserRoles" ("UserId", "RoleId") VALUES (1, 2);


--
-- TOC entry 3327 (class 0 OID 17885)
-- Dependencies: 201
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Users" ("Id", "Name", "Created") VALUES (1, 'Administrator', '2017-01-01 00:00:00');


--
-- TOC entry 3341 (class 0 OID 17991)
-- Dependencies: 215
-- Data for Name: Variables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (1, 1, 'SmtpServer', 'SMTP server', 'test', 1);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (2, 1, 'SmtpPort', 'SMTP port', '25', 2);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (3, 1, 'SmtpUseSsl', 'SMTP use SSL', 'no', 3);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (4, 1, 'SmtpLogin', 'SMTP login', 'test', 4);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (5, 1, 'SmtpPassword', 'SMTP password', 'test', 5);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (6, 1, 'SmtpSenderEmail', 'SMTP sender email', 'test', 6);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (7, 1, 'SmtpSenderName', 'SMTP sender name', 'test', 7);
INSERT INTO public."Variables" ("Id", "ConfigurationId", "Code", "Name", "Value", "Position") VALUES (8, 2, 'SpecifyCultureInUrl', 'Specify culture in URL', 'yes', 1);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 226
-- Name: Classes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Classes_Id_seq"', 2, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 258
-- Name: CompletedFields_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CompletedFields_Id_seq"', 1, false);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 256
-- Name: CompletedForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CompletedForms_Id_seq"', 1, false);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 212
-- Name: Configurations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Configurations_Id_seq"', 3, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 202
-- Name: CredentialTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CredentialTypes_Id_seq"', 2, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 204
-- Name: Credentials_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Credentials_Id_seq"', 2, false);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 224
-- Name: DataSources_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSources_Id_seq"', 2, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 236
-- Name: DataTypeParameterValues_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataTypeParameterValues_Id_seq"', 8, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 232
-- Name: DataTypeParameters_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataTypeParameters_Id_seq"', 8, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 230
-- Name: DataTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataTypes_Id_seq"', 9, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 217
-- Name: Dictionaries_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dictionaries_Id_seq"', 24, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 221
-- Name: Endpoints_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Endpoints_Id_seq"', 2, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 254
-- Name: FieldOptions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FieldOptions_Id_seq"', 1, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 250
-- Name: FieldTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FieldTypes_Id_seq"', 8, false);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 252
-- Name: Fields_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Fields_Id_seq"', 3, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 260
-- Name: Files_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Files_Id_seq"', 1, false);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 248
-- Name: Forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Forms_Id_seq"', 1, true);


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 219
-- Name: Localizations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Localizations_Id_seq"', 66, true);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 234
-- Name: Members_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Members_Id_seq"', 5, true);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 246
-- Name: MenuItems_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MenuItems_Id_seq"', 3, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 244
-- Name: Menus_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Menus_Id_seq"', 1, true);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 238
-- Name: Objects_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Objects_Id_seq"', 3, true);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 209
-- Name: Permissions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Permissions_Id_seq"', 27, false);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 240
-- Name: Properties_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Properties_Id_seq"', 15, true);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 242
-- Name: Relations_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Relations_Id_seq"', 1, false);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 206
-- Name: Roles_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Roles_Id_seq"', 4, false);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 228
-- Name: Tabs_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tabs_Id_seq"', 1, true);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 200
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 2, false);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 214
-- Name: Variables_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Variables_Id_seq"', 8, false);


--
-- TOC entry 3119 (class 2606 OID 18094)
-- Name: Classes PK_Classes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Classes"
    ADD CONSTRAINT "PK_Classes" PRIMARY KEY ("Id");


--
-- TOC entry 3151 (class 2606 OID 18398)
-- Name: CompletedFields PK_CompletedFields; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields"
    ADD CONSTRAINT "PK_CompletedFields" PRIMARY KEY ("Id");


--
-- TOC entry 3149 (class 2606 OID 18382)
-- Name: CompletedForms PK_CompletedForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedForms"
    ADD CONSTRAINT "PK_CompletedForms" PRIMARY KEY ("Id");


--
-- TOC entry 3103 (class 2606 OID 17988)
-- Name: Configurations PK_Configurations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Configurations"
    ADD CONSTRAINT "PK_Configurations" PRIMARY KEY ("Id");


--
-- TOC entry 3091 (class 2606 OID 17904)
-- Name: CredentialTypes PK_CredentialTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CredentialTypes"
    ADD CONSTRAINT "PK_CredentialTypes" PRIMARY KEY ("Id");


--
-- TOC entry 3093 (class 2606 OID 17915)
-- Name: Credentials PK_Credentials; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "PK_Credentials" PRIMARY KEY ("Id");


--
-- TOC entry 3107 (class 2606 OID 18012)
-- Name: Cultures PK_Cultures; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cultures"
    ADD CONSTRAINT "PK_Cultures" PRIMARY KEY ("Id");


--
-- TOC entry 3117 (class 2606 OID 18078)
-- Name: DataSources PK_DataSources; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSources"
    ADD CONSTRAINT "PK_DataSources" PRIMARY KEY ("Id");


--
-- TOC entry 3129 (class 2606 OID 18184)
-- Name: DataTypeParameterValues PK_DataTypeParameterValues; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterValues"
    ADD CONSTRAINT "PK_DataTypeParameterValues" PRIMARY KEY ("Id");


--
-- TOC entry 3125 (class 2606 OID 18137)
-- Name: DataTypeParameters PK_DataTypeParameters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameters"
    ADD CONSTRAINT "PK_DataTypeParameters" PRIMARY KEY ("Id");


--
-- TOC entry 3123 (class 2606 OID 18126)
-- Name: DataTypes PK_DataTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypes"
    ADD CONSTRAINT "PK_DataTypes" PRIMARY KEY ("Id");


--
-- TOC entry 3109 (class 2606 OID 18020)
-- Name: Dictionaries PK_Dictionaries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dictionaries"
    ADD CONSTRAINT "PK_Dictionaries" PRIMARY KEY ("Id");


--
-- TOC entry 3115 (class 2606 OID 18057)
-- Name: EndpointPermissions PK_EndpointPermissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EndpointPermissions"
    ADD CONSTRAINT "PK_EndpointPermissions" PRIMARY KEY ("EndpointId", "PermissionId");


--
-- TOC entry 3113 (class 2606 OID 18052)
-- Name: Endpoints PK_Endpoints; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Endpoints"
    ADD CONSTRAINT "PK_Endpoints" PRIMARY KEY ("Id");


--
-- TOC entry 3147 (class 2606 OID 18364)
-- Name: FieldOptions PK_FieldOptions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions"
    ADD CONSTRAINT "PK_FieldOptions" PRIMARY KEY ("Id");


--
-- TOC entry 3143 (class 2606 OID 18330)
-- Name: FieldTypes PK_FieldTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldTypes"
    ADD CONSTRAINT "PK_FieldTypes" PRIMARY KEY ("Id");


--
-- TOC entry 3145 (class 2606 OID 18341)
-- Name: Fields PK_Fields; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "PK_Fields" PRIMARY KEY ("Id");


--
-- TOC entry 3153 (class 2606 OID 18419)
-- Name: Files PK_Files; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Files"
    ADD CONSTRAINT "PK_Files" PRIMARY KEY ("Id");


--
-- TOC entry 3141 (class 2606 OID 18309)
-- Name: Forms PK_Forms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "PK_Forms" PRIMARY KEY ("Id");


--
-- TOC entry 3111 (class 2606 OID 18031)
-- Name: Localizations PK_Localizations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations"
    ADD CONSTRAINT "PK_Localizations" PRIMARY KEY ("Id");


--
-- TOC entry 3127 (class 2606 OID 18153)
-- Name: Members PK_Members; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "PK_Members" PRIMARY KEY ("Id");


--
-- TOC entry 3139 (class 2606 OID 18283)
-- Name: MenuItems PK_MenuItems; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "PK_MenuItems" PRIMARY KEY ("Id");


--
-- TOC entry 3137 (class 2606 OID 18267)
-- Name: Menus PK_Menus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "PK_Menus" PRIMARY KEY ("Id");


--
-- TOC entry 3131 (class 2606 OID 18202)
-- Name: Objects PK_Objects; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects"
    ADD CONSTRAINT "PK_Objects" PRIMARY KEY ("Id");


--
-- TOC entry 3099 (class 2606 OID 17962)
-- Name: Permissions PK_Permissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "PK_Permissions" PRIMARY KEY ("Id");


--
-- TOC entry 3133 (class 2606 OID 18218)
-- Name: Properties PK_Properties; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "PK_Properties" PRIMARY KEY ("Id");


--
-- TOC entry 3135 (class 2606 OID 18241)
-- Name: Relations PK_Relations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "PK_Relations" PRIMARY KEY ("Id");


--
-- TOC entry 3101 (class 2606 OID 17967)
-- Name: RolePermissions PK_RolePermissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "PK_RolePermissions" PRIMARY KEY ("RoleId", "PermissionId");


--
-- TOC entry 3095 (class 2606 OID 17936)
-- Name: Roles PK_Roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "PK_Roles" PRIMARY KEY ("Id");


--
-- TOC entry 3121 (class 2606 OID 18110)
-- Name: Tabs PK_Tabs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tabs"
    ADD CONSTRAINT "PK_Tabs" PRIMARY KEY ("Id");


--
-- TOC entry 3097 (class 2606 OID 17941)
-- Name: UserRoles PK_UserRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "PK_UserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 3089 (class 2606 OID 17893)
-- Name: Users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- TOC entry 3105 (class 2606 OID 17999)
-- Name: Variables PK_Variable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variables"
    ADD CONSTRAINT "PK_Variable" PRIMARY KEY ("Id");


--
-- TOC entry 3166 (class 2606 OID 18095)
-- Name: Classes FK_Classes_Classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Classes"
    ADD CONSTRAINT "FK_Classes_Classes" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE SET NULL;


--
-- TOC entry 3194 (class 2606 OID 18399)
-- Name: CompletedFields FK_CompletedFields_CompletedForms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields"
    ADD CONSTRAINT "FK_CompletedFields_CompletedForms" FOREIGN KEY ("CompletedFormId") REFERENCES public."CompletedForms"("Id") ON DELETE CASCADE;


--
-- TOC entry 3195 (class 2606 OID 18404)
-- Name: CompletedFields FK_CompletedFields_Fields; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedFields"
    ADD CONSTRAINT "FK_CompletedFields_Fields" FOREIGN KEY ("FieldId") REFERENCES public."Fields"("Id") ON DELETE CASCADE;


--
-- TOC entry 3193 (class 2606 OID 18383)
-- Name: CompletedForms FK_CompletedForms_Forms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompletedForms"
    ADD CONSTRAINT "FK_CompletedForms_Forms" FOREIGN KEY ("FormId") REFERENCES public."Forms"("Id") ON DELETE CASCADE;


--
-- TOC entry 3155 (class 2606 OID 17921)
-- Name: Credentials FK_Credentials_CredentialTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "FK_Credentials_CredentialTypes" FOREIGN KEY ("CredentialTypeId") REFERENCES public."CredentialTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3154 (class 2606 OID 17916)
-- Name: Credentials FK_Credentials_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credentials"
    ADD CONSTRAINT "FK_Credentials_Users" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 3165 (class 2606 OID 18079)
-- Name: DataSources FK_DataSources_Endpoints; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSources"
    ADD CONSTRAINT "FK_DataSources_Endpoints" FOREIGN KEY ("EndpointId") REFERENCES public."Endpoints"("Id") ON DELETE CASCADE;


--
-- TOC entry 3173 (class 2606 OID 18185)
-- Name: DataTypeParameterValues FK_DataTypeParameterValues_DataTypeParameters_DataTypeParameter; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterValues"
    ADD CONSTRAINT "FK_DataTypeParameterValues_DataTypeParameters_DataTypeParameter" FOREIGN KEY ("DataTypeParameterId") REFERENCES public."DataTypeParameters"("Id") ON DELETE CASCADE;


--
-- TOC entry 3174 (class 2606 OID 18190)
-- Name: DataTypeParameterValues FK_DataTypeParameterValues_Members_MemberId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameterValues"
    ADD CONSTRAINT "FK_DataTypeParameterValues_Members_MemberId" FOREIGN KEY ("MemberId") REFERENCES public."Members"("Id") ON DELETE CASCADE;


--
-- TOC entry 3168 (class 2606 OID 18138)
-- Name: DataTypeParameters FK_DataTypeParameters_DataTypes_DataTypeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataTypeParameters"
    ADD CONSTRAINT "FK_DataTypeParameters_DataTypes_DataTypeId" FOREIGN KEY ("DataTypeId") REFERENCES public."DataTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3163 (class 2606 OID 18058)
-- Name: EndpointPermissions FK_EndpointPermissions_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EndpointPermissions"
    ADD CONSTRAINT "FK_EndpointPermissions_Roles" FOREIGN KEY ("EndpointId") REFERENCES public."Endpoints"("Id") ON DELETE CASCADE;


--
-- TOC entry 3192 (class 2606 OID 18370)
-- Name: FieldOptions FK_FieldOptions_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions"
    ADD CONSTRAINT "FK_FieldOptions_Dictionaries" FOREIGN KEY ("ValueId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3191 (class 2606 OID 18365)
-- Name: FieldOptions FK_FieldOptions_Fields; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FieldOptions"
    ADD CONSTRAINT "FK_FieldOptions_Fields" FOREIGN KEY ("FieldId") REFERENCES public."Fields"("Id") ON DELETE CASCADE;


--
-- TOC entry 3190 (class 2606 OID 18352)
-- Name: Fields FK_Fields_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "FK_Fields_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3189 (class 2606 OID 18347)
-- Name: Fields FK_Fields_FieldTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "FK_Fields_FieldTypes" FOREIGN KEY ("FieldTypeId") REFERENCES public."FieldTypes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3188 (class 2606 OID 18342)
-- Name: Fields FK_Fields_Forms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fields"
    ADD CONSTRAINT "FK_Fields_Forms" FOREIGN KEY ("FormId") REFERENCES public."Forms"("Id") ON DELETE CASCADE;


--
-- TOC entry 3186 (class 2606 OID 18310)
-- Name: Forms FK_Forms_Dictionaries_NameId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "FK_Forms_Dictionaries_NameId" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3187 (class 2606 OID 18315)
-- Name: Forms FK_Forms_Dictionaries_SubmitButtonTitleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "FK_Forms_Dictionaries_SubmitButtonTitleId" FOREIGN KEY ("SubmitButtonTitleId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3162 (class 2606 OID 18037)
-- Name: Localizations FK_Localizations_Cultures; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations"
    ADD CONSTRAINT "FK_Localizations_Cultures" FOREIGN KEY ("CultureId") REFERENCES public."Cultures"("Id") ON DELETE CASCADE;


--
-- TOC entry 3161 (class 2606 OID 18032)
-- Name: Localizations FK_Localizations_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localizations"
    ADD CONSTRAINT "FK_Localizations_Dictionaries" FOREIGN KEY ("DictionaryId") REFERENCES public."Dictionaries"("Id") ON DELETE CASCADE;


--
-- TOC entry 3169 (class 2606 OID 18154)
-- Name: Members FK_Members_Classes_ClassId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_Classes_ClassId" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3172 (class 2606 OID 18169)
-- Name: Members FK_Members_Classes_RelationClassId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_Classes_RelationClassId" FOREIGN KEY ("RelationClassId") REFERENCES public."Classes"("Id") ON DELETE SET NULL;


--
-- TOC entry 3171 (class 2606 OID 18164)
-- Name: Members FK_Members_DataTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_DataTypes" FOREIGN KEY ("PropertyDataTypeId") REFERENCES public."DataTypes"("Id") ON DELETE SET NULL;


--
-- TOC entry 3170 (class 2606 OID 18159)
-- Name: Members FK_Members_Tabs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "FK_Members_Tabs" FOREIGN KEY ("TabId") REFERENCES public."Tabs"("Id") ON DELETE SET NULL;


--
-- TOC entry 3185 (class 2606 OID 18294)
-- Name: MenuItems FK_MenuItems_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3184 (class 2606 OID 18289)
-- Name: MenuItems FK_MenuItems_MenuItems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_MenuItems" FOREIGN KEY ("MenuItemId") REFERENCES public."MenuItems"("Id") ON DELETE CASCADE;


--
-- TOC entry 3183 (class 2606 OID 18284)
-- Name: MenuItems FK_MenuItems_Menus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MenuItems"
    ADD CONSTRAINT "FK_MenuItems_Menus" FOREIGN KEY ("MenuId") REFERENCES public."Menus"("Id") ON DELETE CASCADE;


--
-- TOC entry 3182 (class 2606 OID 18268)
-- Name: Menus FK_Menus_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Menus"
    ADD CONSTRAINT "FK_Menus_Dictionaries" FOREIGN KEY ("NameId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3175 (class 2606 OID 18203)
-- Name: Objects FK_Objects_Classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects"
    ADD CONSTRAINT "FK_Objects_Classes" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3178 (class 2606 OID 18229)
-- Name: Properties FK_Properties_Dictionaries; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Dictionaries" FOREIGN KEY ("StringValueId") REFERENCES public."Dictionaries"("Id");


--
-- TOC entry 3177 (class 2606 OID 18224)
-- Name: Properties FK_Properties_Members; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Members" FOREIGN KEY ("MemberId") REFERENCES public."Members"("Id") ON DELETE CASCADE;


--
-- TOC entry 3176 (class 2606 OID 18219)
-- Name: Properties FK_Properties_Objects; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Properties"
    ADD CONSTRAINT "FK_Properties_Objects" FOREIGN KEY ("ObjectId") REFERENCES public."Objects"("Id") ON DELETE CASCADE;


--
-- TOC entry 3179 (class 2606 OID 18242)
-- Name: Relations FK_Relations_Members; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "FK_Relations_Members" FOREIGN KEY ("MemberId") REFERENCES public."Members"("Id") ON DELETE CASCADE;


--
-- TOC entry 3181 (class 2606 OID 18252)
-- Name: Relations FK_Relations_Objects_ForeignId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "FK_Relations_Objects_ForeignId" FOREIGN KEY ("ForeignId") REFERENCES public."Objects"("Id") ON DELETE CASCADE;


--
-- TOC entry 3180 (class 2606 OID 18247)
-- Name: Relations FK_Relations_Objects_PrimaryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Relations"
    ADD CONSTRAINT "FK_Relations_Objects_PrimaryId" FOREIGN KEY ("PrimaryId") REFERENCES public."Objects"("Id") ON DELETE CASCADE;


--
-- TOC entry 3159 (class 2606 OID 17973)
-- Name: RolePermissions FK_RolePermissions_Permissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "FK_RolePermissions_Permissions" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"("Id") ON DELETE CASCADE;


--
-- TOC entry 3164 (class 2606 OID 18063)
-- Name: EndpointPermissions FK_RolePermissions_Permissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EndpointPermissions"
    ADD CONSTRAINT "FK_RolePermissions_Permissions" FOREIGN KEY ("PermissionId") REFERENCES public."Permissions"("Id") ON DELETE CASCADE;


--
-- TOC entry 3158 (class 2606 OID 17968)
-- Name: RolePermissions FK_RolePermissions_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "FK_RolePermissions_Roles" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- TOC entry 3167 (class 2606 OID 18111)
-- Name: Tabs FK_Tabs_Classes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tabs"
    ADD CONSTRAINT "FK_Tabs_Classes" FOREIGN KEY ("ClassId") REFERENCES public."Classes"("Id") ON DELETE CASCADE;


--
-- TOC entry 3157 (class 2606 OID 17947)
-- Name: UserRoles FK_UserRoles_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Roles" FOREIGN KEY ("RoleId") REFERENCES public."Roles"("Id") ON DELETE CASCADE;


--
-- TOC entry 3156 (class 2606 OID 17942)
-- Name: UserRoles FK_UserRoles_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRoles"
    ADD CONSTRAINT "FK_UserRoles_Users" FOREIGN KEY ("UserId") REFERENCES public."Users"("Id") ON DELETE CASCADE;


--
-- TOC entry 3160 (class 2606 OID 18000)
-- Name: Variables FK_Variables_Configurations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Variables"
    ADD CONSTRAINT "FK_Variables_Configurations" FOREIGN KEY ("ConfigurationId") REFERENCES public."Configurations"("Id") ON DELETE CASCADE;


-- Completed on 2021-03-24 12:57:41

--
-- PostgreSQL database dump complete
--

