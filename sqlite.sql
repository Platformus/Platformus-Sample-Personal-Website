BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Users" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "PK_User" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CredentialTypes" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_CredentialType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Credentials" (
	"Id"	INTEGER NOT NULL,
	"UserId"	INTEGER NOT NULL,
	"CredentialTypeId"	INTEGER NOT NULL,
	"Identifier"	TEXT NOT NULL,
	"Secret"	TEXT,
	"Extra"	TEXT,
	CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY("CredentialTypeId") REFERENCES "CredentialTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Credential" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Roles" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Role" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "UserRoles" (
	"UserId"	INTEGER NOT NULL,
	"RoleId"	INTEGER NOT NULL,
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY("UserId") REFERENCES "Users"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_UserRole" PRIMARY KEY("UserId","RoleId")
);
CREATE TABLE IF NOT EXISTS "Permissions" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_Permission" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "RolePermissions" (
	"RoleId"	INTEGER NOT NULL,
	"PermissionId"	INTEGER NOT NULL,
	CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY("RoleId") REFERENCES "Roles"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY("PermissionId") REFERENCES "Permissions"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_RolePermission" PRIMARY KEY("RoleId","PermissionId")
);
CREATE TABLE IF NOT EXISTS "Configurations" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	CONSTRAINT "PK_Configuration" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Variables" (
	"Id"	INTEGER NOT NULL,
	"ConfigurationId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Value"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_Variable_Configuration_ConfigurationId" FOREIGN KEY("ConfigurationId") REFERENCES "Configurations"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Variable" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Cultures" (
	"Id"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"IsNeutral"	INTEGER NOT NULL,
	"IsFrontendDefault"	INTEGER NOT NULL,
	"IsBackendDefault"	INTEGER NOT NULL,
	CONSTRAINT "PK_Culture" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "Dictionaries" (
	"Id"	INTEGER NOT NULL,
	CONSTRAINT "PK_Dictionary" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Localizations" (
	"Id"	INTEGER NOT NULL,
	"DictionaryId"	INTEGER NOT NULL,
	"CultureId"	TEXT NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY("DictionaryId") REFERENCES "Dictionaries"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Localization" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Endpoints" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"UrlTemplate"	TEXT,
	"Position"	INTEGER,
	"DisallowAnonymous"	INTEGER NOT NULL,
	"SignInUrl"	TEXT,
	"ResponseCacheCSharpClassName"	TEXT,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	CONSTRAINT "PK_Endpoint" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "EndpointPermissions" (
	"EndpointId"	INTEGER NOT NULL,
	"PermissionId"	INTEGER NOT NULL,
	CONSTRAINT "FK_EndpointPermission_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_EndpointPermission_Permission_PermissionId" FOREIGN KEY("PermissionId") REFERENCES "Permissions"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_EndpointPermission" PRIMARY KEY("EndpointId","PermissionId")
);
CREATE TABLE IF NOT EXISTS "DataSources" (
	"Id"	INTEGER NOT NULL,
	"EndpointId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	CONSTRAINT "FK_DataSource_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_DataSource" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Classes" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"PluralizedName"	TEXT NOT NULL,
	"IsAbstract"	INTEGER NOT NULL,
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL,
	CONSTRAINT "PK_Class" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tabs" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_Tab_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Tab" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypes" (
	"Id"	INTEGER NOT NULL,
	"StorageDataType"	TEXT NOT NULL,
	"JavaScriptEditorClassName"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "PK_DataType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypeParameters" (
	"Id"	INTEGER NOT NULL,
	"DataTypeId"	INT NOT NULL,
	"JavaScriptEditorClassName"	TEXT NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameter_DataType_DataTypeId" FOREIGN KEY("DataTypeId") REFERENCES "DataTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_DataTypeParameter" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Members" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	"TabId"	INTEGER,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	"PropertyDataTypeId"	INTEGER,
	"IsPropertyLocalizable"	INTEGER,
	"IsPropertyVisibleInList"	INTEGER,
	"RelationClassId"	INTEGER,
	"IsRelationSingleParent"	INTEGER,
	"MinRelatedObjectsNumber"	INTEGER,
	"MaxRelatedObjectsNumber"	INTEGER,
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY("PropertyDataTypeId") REFERENCES "DataTypes"("Id") ON DELETE SET NULL,
	CONSTRAINT "FK_Member_Tab_TabId" FOREIGN KEY("TabId") REFERENCES "Tabs"("Id") ON DELETE SET NULL,
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes"("Id") ON DELETE SET NULL,
	CONSTRAINT "PK_Member" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DataTypeParameterValues" (
	"Id"	INTEGER NOT NULL,
	"DataTypeParameterId"	INT NOT NULL,
	"MemberId"	INT NOT NULL,
	"Value"	TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameterValue_DataTypeParameter_DataTypeParameterId" FOREIGN KEY("DataTypeParameterId") REFERENCES "DataTypeParameters"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_DataTypeParameterValue_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_DataTypeParameterValue" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Objects" (
	"Id"	INTEGER NOT NULL,
	"ClassId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Object_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Object" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Properties" (
	"Id"	INTEGER NOT NULL,
	"ObjectId"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"IntegerValue"	INTEGER,
	"DecimalValue"	REAL,
	"StringValueId"	INTEGER,
	"DateTimeValue"	TEXT,
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Property" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Relations" (
	"Id"	INTEGER NOT NULL,
	"MemberId"	INTEGER NOT NULL,
	"PrimaryId"	INTEGER NOT NULL,
	"ForeignId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY("PrimaryId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY("ForeignId") REFERENCES "Objects"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Relation" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Menus" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Menu" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MenuItems" (
	"Id"	INTEGER NOT NULL,
	"MenuId"	INTEGER,
	"MenuItemId"	INTEGER,
	"NameId"	INTEGER NOT NULL,
	"Url"	TEXT,
	"Position"	INTEGER,
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_MenuItem" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Forms" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"SubmitButtonTitleId"	INTEGER NOT NULL,
	"ProduceCompletedForms"	INTEGER NOT NULL,
	"CSharpClassName"	TEXT NOT NULL,
	"Parameters"	TEXT,
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_Form_Dictionary_SubmitButtonTitleId" FOREIGN KEY("SubmitButtonTitleId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Form" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "FieldTypes" (
	"Id"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Position"	INTEGER,
	"ValidatorCSharpClassName"	TEXT,
	CONSTRAINT "PK_FieldType" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Fields" (
	"Id"	INTEGER NOT NULL,
	"FormId"	INTEGER NOT NULL,
	"FieldTypeId"	INTEGER NOT NULL,
	"Code"	TEXT NOT NULL,
	"NameId"	INTEGER NOT NULL,
	"IsRequired"	INTEGER NOT NULL,
	"MaxLength"	INTEGER,
	"Position"	INTEGER,
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY("FieldTypeId") REFERENCES "FieldTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "PK_Field" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "FieldOptions" (
	"Id"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"ValueId"	INTEGER NOT NULL,
	"Position"	INTEGER,
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY("ValueId") REFERENCES "Dictionaries"("Id"),
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_FieldOption" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CompletedForms" (
	"Id"	INTEGER NOT NULL,
	"FormId"	INTEGER NOT NULL,
	"Created"	TEXT NOT NULL,
	CONSTRAINT "FK_CompletedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_CompletedForm" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "CompletedFields" (
	"Id"	INTEGER NOT NULL,
	"CompletedFormId"	INTEGER NOT NULL,
	"FieldId"	INTEGER NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "FK_CompletedField_CompletedForm_CompletedFormId" FOREIGN KEY("CompletedFormId") REFERENCES "CompletedForms"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_CompletedField_Field_FieldId" FOREIGN KEY("FieldId") REFERENCES "Fields"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_CompletedField" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Files" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	"Size"	INTEGER NOT NULL,
	CONSTRAINT "PK_File" PRIMARY KEY("Id" AUTOINCREMENT)
);
INSERT INTO "Users" VALUES (1,'Administrator','2017-01-01 00:00:00.0000000');
INSERT INTO "CredentialTypes" VALUES (1,'Email','Email',1);
INSERT INTO "Credentials" VALUES (1,1,1,'admin@platformus.net','8lE3xN2Ijiv/Y/aIGwaZLrbcqrt/1jDmzPTdudKbVD0=','0O/ZGwhScZRGbsmiUEckOg==');
INSERT INTO "Roles" VALUES (1,'Developer','Developer',100);
INSERT INTO "Roles" VALUES (2,'Administrator','Administrator',200);
INSERT INTO "Roles" VALUES (3,'ContentManager','Content manager',300);
INSERT INTO "UserRoles" VALUES (1,1);
INSERT INTO "UserRoles" VALUES (1,2);
INSERT INTO "Permissions" VALUES (1,'DoAnything','Do anything',100);
INSERT INTO "Permissions" VALUES (2,'ManagePermissions','Manage permissions',200);
INSERT INTO "Permissions" VALUES (3,'ManageRoles','Manage roles',300);
INSERT INTO "Permissions" VALUES (4,'ManageUsers','Manage users',400);
INSERT INTO "Permissions" VALUES (5,'ManageConfigurations','Manage configurations',500);
INSERT INTO "Permissions" VALUES (6,'ManageCultures','Manage cultures',600);
INSERT INTO "Permissions" VALUES (7,'ManageEndpoints','Manage endpoints',700);
INSERT INTO "Permissions" VALUES (8,'ManageObjects','Manage objects',800);
INSERT INTO "Permissions" VALUES (9,'ManageDataTypes','Manage data types',900);
INSERT INTO "Permissions" VALUES (10,'ManageClasses','Manage classes',1000);
INSERT INTO "Permissions" VALUES (11,'ManageMenus','Manage menus',1100);
INSERT INTO "Permissions" VALUES (12,'ManageForms','Manage forms',1200);
INSERT INTO "Permissions" VALUES (13,'ManageFileManager','Manage file manager',1300);
INSERT INTO "RolePermissions" VALUES (1,1);
INSERT INTO "RolePermissions" VALUES (2,1);
INSERT INTO "RolePermissions" VALUES (3,8);
INSERT INTO "RolePermissions" VALUES (3,11);
INSERT INTO "RolePermissions" VALUES (3,12);
INSERT INTO "RolePermissions" VALUES (3,13);
INSERT INTO "Configurations" VALUES (1,'Email','Email');
INSERT INTO "Configurations" VALUES (2,'Globalization','Globalization');
INSERT INTO "Variables" VALUES (1,1,'SmtpServer','SMTP server','test',1);
INSERT INTO "Variables" VALUES (2,1,'SmtpPort','SMTP port','25',2);
INSERT INTO "Variables" VALUES (3,1,'SmtpUseSsl','SMTP use SSL','no',3);
INSERT INTO "Variables" VALUES (4,1,'SmtpLogin','SMTP login','test',4);
INSERT INTO "Variables" VALUES (5,1,'SmtpPassword','SMTP password','test',5);
INSERT INTO "Variables" VALUES (6,1,'SmtpSenderEmail','SMTP sender email','test',6);
INSERT INTO "Variables" VALUES (7,1,'SmtpSenderName','SMTP sender name','test',7);
INSERT INTO "Variables" VALUES (8,2,'SpecifyCultureInUrl','Specify culture in URL','yes',1);
INSERT INTO "Cultures" VALUES ('__','Neutral',1,0,0);
INSERT INTO "Cultures" VALUES ('en','English',0,1,1);
INSERT INTO "Cultures" VALUES ('ru','Русский',0,0,0);
INSERT INTO "Cultures" VALUES ('uk','Українська',0,0,0);
INSERT INTO "Dictionaries" VALUES (1);
INSERT INTO "Dictionaries" VALUES (2);
INSERT INTO "Dictionaries" VALUES (3);
INSERT INTO "Dictionaries" VALUES (4);
INSERT INTO "Dictionaries" VALUES (5);
INSERT INTO "Dictionaries" VALUES (6);
INSERT INTO "Dictionaries" VALUES (7);
INSERT INTO "Dictionaries" VALUES (8);
INSERT INTO "Dictionaries" VALUES (9);
INSERT INTO "Dictionaries" VALUES (10);
INSERT INTO "Dictionaries" VALUES (11);
INSERT INTO "Dictionaries" VALUES (12);
INSERT INTO "Dictionaries" VALUES (13);
INSERT INTO "Dictionaries" VALUES (14);
INSERT INTO "Dictionaries" VALUES (15);
INSERT INTO "Dictionaries" VALUES (16);
INSERT INTO "Dictionaries" VALUES (17);
INSERT INTO "Dictionaries" VALUES (18);
INSERT INTO "Dictionaries" VALUES (19);
INSERT INTO "Dictionaries" VALUES (20);
INSERT INTO "Dictionaries" VALUES (21);
INSERT INTO "Dictionaries" VALUES (22);
INSERT INTO "Dictionaries" VALUES (23);
INSERT INTO "Dictionaries" VALUES (24);
INSERT INTO "Localizations" VALUES (1,1,'en','Main');
INSERT INTO "Localizations" VALUES (2,1,'ru','Главное');
INSERT INTO "Localizations" VALUES (3,1,'uk','Головне');
INSERT INTO "Localizations" VALUES (4,2,'uk','Головна');
INSERT INTO "Localizations" VALUES (5,2,'ru','Главная');
INSERT INTO "Localizations" VALUES (6,2,'en','Home');
INSERT INTO "Localizations" VALUES (7,3,'uk','Про мене');
INSERT INTO "Localizations" VALUES (8,3,'ru','Обо мне');
INSERT INTO "Localizations" VALUES (9,3,'en','About me');
INSERT INTO "Localizations" VALUES (10,4,'uk','Контакти');
INSERT INTO "Localizations" VALUES (11,4,'ru','Контакты');
INSERT INTO "Localizations" VALUES (12,4,'en','Contacts');
INSERT INTO "Localizations" VALUES (13,5,'uk','Зворотний зв’язок');
INSERT INTO "Localizations" VALUES (14,5,'ru','Обратная связь');
INSERT INTO "Localizations" VALUES (15,5,'en','Feedback');
INSERT INTO "Localizations" VALUES (16,6,'en','Submit');
INSERT INTO "Localizations" VALUES (17,6,'ru','Отправить');
INSERT INTO "Localizations" VALUES (18,6,'uk','Надіслати');
INSERT INTO "Localizations" VALUES (19,7,'uk','Ваше ім’я');
INSERT INTO "Localizations" VALUES (20,7,'ru','Ваше имя');
INSERT INTO "Localizations" VALUES (21,7,'en','Your name');
INSERT INTO "Localizations" VALUES (22,8,'uk','Ваша електронна пошта');
INSERT INTO "Localizations" VALUES (23,8,'ru','Ваша электронная почта');
INSERT INTO "Localizations" VALUES (24,8,'en','Your email');
INSERT INTO "Localizations" VALUES (25,9,'uk','Ваше повідомлення');
INSERT INTO "Localizations" VALUES (26,9,'ru','Ваше сообщение');
INSERT INTO "Localizations" VALUES (27,9,'en','Your message');
INSERT INTO "Localizations" VALUES (28,10,'__','/');
INSERT INTO "Localizations" VALUES (29,11,'uk','<h1>Ваш персональний веб-сайт</h1><p>Вітаємо! Це ваш персональний веб-сайт, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO "Localizations" VALUES (30,11,'ru','<h1>Ваш персональный веб-сайт</h1><p>Здравствуйте! Это ваш персональный веб-сайт, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO "Localizations" VALUES (31,11,'en','<h1>Your Personal Website</h1><p>Hello! This is your personal website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO "Localizations" VALUES (32,12,'uk','Ваш персональний веб-сайт');
INSERT INTO "Localizations" VALUES (33,12,'ru','Ваш персональный веб-сайт');
INSERT INTO "Localizations" VALUES (34,12,'en','Your Personal Website');
INSERT INTO "Localizations" VALUES (35,13,'uk','');
INSERT INTO "Localizations" VALUES (36,13,'ru','');
INSERT INTO "Localizations" VALUES (37,13,'en','');
INSERT INTO "Localizations" VALUES (38,14,'uk','');
INSERT INTO "Localizations" VALUES (39,14,'ru','');
INSERT INTO "Localizations" VALUES (40,14,'en','');
INSERT INTO "Localizations" VALUES (41,15,'__','/about-me');
INSERT INTO "Localizations" VALUES (42,16,'uk','<h1>Про мене</h1><p>Розкажіть про себе в кількох словах. Ви можете додати сюди фотографії або відео.</p>');
INSERT INTO "Localizations" VALUES (43,16,'ru','<h1>Обо мне</h1><p>Расскажите о себе в нескольких словах. Вы можете добавить сюда фотографии или видео.</p>');
INSERT INTO "Localizations" VALUES (44,16,'en','<h1>About Me</h1><p>Tell us about yourself in a few words. You can add photos or videos here.</p>');
INSERT INTO "Localizations" VALUES (45,17,'uk','Про мене');
INSERT INTO "Localizations" VALUES (46,17,'ru','Обо мне');
INSERT INTO "Localizations" VALUES (47,17,'en','About Me');
INSERT INTO "Localizations" VALUES (48,18,'uk','');
INSERT INTO "Localizations" VALUES (49,18,'ru','');
INSERT INTO "Localizations" VALUES (50,18,'en','');
INSERT INTO "Localizations" VALUES (51,19,'uk','');
INSERT INTO "Localizations" VALUES (52,19,'ru','');
INSERT INTO "Localizations" VALUES (53,19,'en','');
INSERT INTO "Localizations" VALUES (54,20,'__','/contacts');
INSERT INTO "Localizations" VALUES (55,21,'uk','<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO "Localizations" VALUES (56,21,'ru','<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO "Localizations" VALUES (57,21,'en','<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO "Localizations" VALUES (58,22,'uk','Контакти');
INSERT INTO "Localizations" VALUES (59,22,'ru','Контакты');
INSERT INTO "Localizations" VALUES (60,22,'en','Contacts');
INSERT INTO "Localizations" VALUES (61,23,'uk','');
INSERT INTO "Localizations" VALUES (62,23,'ru','');
INSERT INTO "Localizations" VALUES (63,23,'en','');
INSERT INTO "Localizations" VALUES (64,24,'uk','');
INSERT INTO "Localizations" VALUES (65,24,'ru','');
INSERT INTO "Localizations" VALUES (66,24,'en','');
INSERT INTO "Endpoints" VALUES (1,'Default','{*url}',1000,0,NULL,NULL,'Platformus.Website.Frontend.DefaultEndpoint','ViewName=RegularPage');
INSERT INTO "Endpoints" VALUES (2,'Contacts','contacts',10,0,NULL,NULL,'Platformus.Website.Frontend.DefaultEndpoint','ViewName=ContactsPage');
INSERT INTO "DataSources" VALUES (1,1,'Page','Platformus.Website.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO "DataSources" VALUES (2,2,'Page','Platformus.Website.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO "Classes" VALUES (1,NULL,'Page','Page','Pages',1);
INSERT INTO "Classes" VALUES (2,1,'RegularPage','Regular Page','Regular Pages',0);
INSERT INTO "Tabs" VALUES (1,1,'SEO',100);
INSERT INTO "DataTypes" VALUES (1,'string','singleLinePlainText','Single line plain text',1);
INSERT INTO "DataTypes" VALUES (2,'string','multilinePlainText','Multiline plain text',2);
INSERT INTO "DataTypes" VALUES (3,'string','html','Html',3);
INSERT INTO "DataTypes" VALUES (4,'integer','integerNumber','Integer number',4);
INSERT INTO "DataTypes" VALUES (5,'decimal','decimalNumber','Decimal number',5);
INSERT INTO "DataTypes" VALUES (6,'integer','booleanFlag','Boolean flag',6);
INSERT INTO "DataTypes" VALUES (7,'datetime','date','Date',7);
INSERT INTO "DataTypes" VALUES (8,'string','image','Image',8);
INSERT INTO "DataTypes" VALUES (9,'string','sourceCode','Source code',9);
INSERT INTO "DataTypeParameters" VALUES (1,1,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (2,1,'numericTextBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (4,2,'numericTextBox','MaxLength','Max length');
INSERT INTO "DataTypeParameters" VALUES (5,7,'checkbox','IsRequired','Is required');
INSERT INTO "DataTypeParameters" VALUES (6,8,'numericTextBox','Width','Width');
INSERT INTO "DataTypeParameters" VALUES (7,8,'numericTextBox','Height','Height');
INSERT INTO "DataTypeParameters" VALUES (8,9,'textBox','Mode','Mode');
INSERT INTO "Members" VALUES (1,1,NULL,'Url','URL',1,1,0,1,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (2,1,NULL,'Content','Content',10,3,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (3,1,1,'Title','Title',1000,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (4,1,1,'MetaDescription','META description',1010,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "Members" VALUES (5,1,1,'MetaKeywords','META keywords',1020,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO "DataTypeParameterValues" VALUES (1,1,1,'true');
INSERT INTO "DataTypeParameterValues" VALUES (2,2,1,'128');
INSERT INTO "DataTypeParameterValues" VALUES (3,1,3,'false');
INSERT INTO "DataTypeParameterValues" VALUES (4,2,3,'128');
INSERT INTO "DataTypeParameterValues" VALUES (5,1,4,'false');
INSERT INTO "DataTypeParameterValues" VALUES (6,2,4,'512');
INSERT INTO "DataTypeParameterValues" VALUES (7,1,5,'false');
INSERT INTO "DataTypeParameterValues" VALUES (8,2,5,'256');
INSERT INTO "Objects" VALUES (1,2);
INSERT INTO "Objects" VALUES (2,2);
INSERT INTO "Objects" VALUES (3,2);
INSERT INTO "Properties" VALUES (1,1,1,NULL,NULL,10,NULL);
INSERT INTO "Properties" VALUES (2,1,2,NULL,NULL,11,NULL);
INSERT INTO "Properties" VALUES (3,1,3,NULL,NULL,12,NULL);
INSERT INTO "Properties" VALUES (4,1,4,NULL,NULL,13,NULL);
INSERT INTO "Properties" VALUES (5,1,5,NULL,NULL,14,NULL);
INSERT INTO "Properties" VALUES (6,2,1,NULL,NULL,15,NULL);
INSERT INTO "Properties" VALUES (7,2,2,NULL,NULL,16,NULL);
INSERT INTO "Properties" VALUES (8,2,3,NULL,NULL,17,NULL);
INSERT INTO "Properties" VALUES (9,2,4,NULL,NULL,18,NULL);
INSERT INTO "Properties" VALUES (10,2,5,NULL,NULL,19,NULL);
INSERT INTO "Properties" VALUES (11,3,1,NULL,NULL,20,NULL);
INSERT INTO "Properties" VALUES (12,3,2,NULL,NULL,21,NULL);
INSERT INTO "Properties" VALUES (13,3,3,NULL,NULL,22,NULL);
INSERT INTO "Properties" VALUES (14,3,4,NULL,NULL,23,NULL);
INSERT INTO "Properties" VALUES (15,3,5,NULL,NULL,24,NULL);
INSERT INTO "Menus" VALUES (1,'Main',1);
INSERT INTO "MenuItems" VALUES (1,1,NULL,2,'/',10);
INSERT INTO "MenuItems" VALUES (2,1,NULL,3,'/about-me',20);
INSERT INTO "MenuItems" VALUES (3,1,NULL,4,'/contacts',30);
INSERT INTO "Forms" VALUES (1,'Feedback',5,6,1,'Platformus.Website.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/contacts');
INSERT INTO "FieldTypes" VALUES (1,'TextBox','Text box',1,NULL);
INSERT INTO "FieldTypes" VALUES (2,'TextArea','Text area',2,NULL);
INSERT INTO "FieldTypes" VALUES (3,'Checkbox','Checkbox',3,NULL);
INSERT INTO "FieldTypes" VALUES (4,'RadioButtonList','Radio button list',4,NULL);
INSERT INTO "FieldTypes" VALUES (5,'DropDownList','Drop down list',5,NULL);
INSERT INTO "FieldTypes" VALUES (6,'FileUpload','File upload',6,NULL);
INSERT INTO "FieldTypes" VALUES (7,'ReCAPTCHA','ReCAPTCHA',7,'Platformus.Website.Frontend.FormHandlers.ReCaptchaFieldValidator');
INSERT INTO "Fields" VALUES (1,1,1,'Name',7,1,NULL,10);
INSERT INTO "Fields" VALUES (2,1,1,'Email',8,1,NULL,20);
INSERT INTO "Fields" VALUES (3,1,2,'Message',9,1,NULL,30);
COMMIT;
