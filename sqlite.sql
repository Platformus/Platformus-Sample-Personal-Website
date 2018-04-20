BEGIN TRANSACTION;
CREATE TABLE "Variables" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Variable" PRIMARY KEY AUTOINCREMENT,
	"ConfigurationId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Value" TEXT NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Variable_Configuration_ConfigurationId" FOREIGN KEY("ConfigurationId") REFERENCES "Configurations" ("Id")
);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (1,1,'SmtpServer','SMTP server','test',1);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (2,1,'SmtpPort','SMTP port','25',2);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (3,1,'SmtpLogin','SMTP login','test',3);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (4,1,'SmtpPassword','SMTP password','test',4);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (5,1,'SmtpSenderEmail','SMTP sender email','test',5);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (6,1,'SmtpSenderName','SMTP sender name','test',6);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (7,2,'SpecifyCultureInUrl','Specify culture in URL','yes',1);
CREATE TABLE "Users" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_User" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"Created" TEXT NOT NULL
);
INSERT INTO `Users` (Id,Name,Created) VALUES (1,'Administrator','2017-01-01 00:00:00.0000000');
CREATE TABLE "UserRoles" (
	"UserId" INTEGER NOT NULL,
	"RoleId" INTEGER NOT NULL,
	CONSTRAINT "PK_UserRole" PRIMARY KEY ("UserId", "RoleId"),
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id"),
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id")
);
INSERT INTO `UserRoles` (UserId,RoleId) VALUES (1,1);
INSERT INTO `UserRoles` (UserId,RoleId) VALUES (1,2);
CREATE TABLE "Tabs" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Tab" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Tab_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Tabs` (Id,ClassId,Name,Position) VALUES (1,1,'SEO',100);
CREATE TABLE "SerializedObjects" (
	"CultureId" INTEGER NOT NULL,
	"ObjectId" INTEGER NOT NULL,
	"ClassId" INTEGER NOT NULL,
	"UrlPropertyStringValue" TEXT,
	"SerializedProperties" TEXT,
	CONSTRAINT "PK_SerializedObject" PRIMARY KEY("CultureId","ObjectId"),
	CONSTRAINT "FK_SerializedObject_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedObject_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id"),
	CONSTRAINT "FK_SerializedObject_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id")
);
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,1,2,'/','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Your Personal Website</h1><p>Hello! This is your personal website, it is based on the <a href=\"http://platformus.net/\" target=\"_blank\" rel=\"noopener\">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href=\"/backend\">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href=\"http://docs.platformus.net/\" target=\"_blank\" rel=\"noopener\">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href=\"https://gitter.im/Platformus/Platformus\" target=\"_blank\" rel=\"noopener\">chat</a>.</p><p>Have a nice work!</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Your Personal Website","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,1,2,'/','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Ваш персональный веб-сайт</h1><p>Здравствуйте! Это ваш персональный веб-сайт, он работает на базе системы управления содержимым &laquo;<a href=\"http://platformus.net/\" target=\"_blank\" rel=\"noopener\">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href=\"/backend\">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href=\"http://docs.platformus.net/\" target=\"_blank\" rel=\"noopener\">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href=\"https://gitter.im/Platformus/Platformus\" target=\"_blank\" rel=\"noopener\">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Ваш персональный веб-сайт","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,1,2,'/','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Ваш персональний веб-сайт</h1><p>Вітаємо! Це ваш персональний веб-сайт, він працює на базі системи керування вмістом &laquo;<a href=\"http://platformus.net/\" target=\"_blank\" rel=\"noopener\">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href=\"/backend\">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href=\"http://docs.platformus.net/\" target=\"_blank\" rel=\"noopener\">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href=\"https://gitter.im/Platformus/Platformus\" target=\"_blank\" rel=\"noopener\">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Ваш персональний веб-сайт","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,2,2,'/about-me','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/about-me","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>About Me</h1><p>Tell us about yourself in a few words. You can add photos or videos here.</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"About Me","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,2,2,'/about-me','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/about-me","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Обо мне</h1><p>Расскажите о себе в нескольких словах. Вы можете добавить сюда фотографии или видео.</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Обо мне","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,2,2,'/about-me','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/about-me","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Про мене</h1><p>Розкажіть про себе в кількох словах. Ви можете додати сюди фотографії або відео.</p>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Про мене","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,3,2,'/contacts','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Contacts","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,3,2,'/contacts','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Контакты","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,3,2,'/contacts','[{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Контакти","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
CREATE TABLE "SerializedMenus" (
	"CultureId" INTEGER NOT NULL,
	"MenuId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"SerializedMenuItems" TEXT,
	CONSTRAINT "PK_SerializedMenu" PRIMARY KEY("CultureId","MenuId"),
	CONSTRAINT "FK_SerializedMenu_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedMenu_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id")
);
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (2,1,'Main','[{"MenuItemId":1,"Name":"Home","Url":"/","Position":10,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"About me","Url":"/about-me","Position":20,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Contacts","Url":"/contacts","Position":30,"SerializedMenuItems":null}]');
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (3,1,'Main','[{"MenuItemId":1,"Name":"Главная","Url":"/","Position":10,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"Обо мне","Url":"/about-me","Position":20,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Контакты","Url":"/contacts","Position":30,"SerializedMenuItems":null}]');
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (4,1,'Main','[{"MenuItemId":1,"Name":"Головна","Url":"/","Position":10,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"Про мене","Url":"/about-me","Position":20,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Контакти","Url":"/contacts","Position":30,"SerializedMenuItems":null}]');
CREATE TABLE "SerializedForms" (
	"CultureId" INTEGER NOT NULL,
	"FormId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"SerializedFields" TEXT,
	CONSTRAINT "PK_SerializedForm" PRIMARY KEY("CultureId","FormId"),
	CONSTRAINT "FK_SerializedForm_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id")
);
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (2,1,'Feedback','Feedback','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Your name","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Your email","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Your message","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (3,1,'Feedback','Обратная связь','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше имя","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Ваша электронная почта","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше сообщение","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (4,1,'Feedback','Зворотний зв’язок','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше ім’я","IsRequired":true,"MaxLength":null,"Position":10,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Email","Name":"Ваша електронна пошта","IsRequired":true,"MaxLength":null,"Position":20,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше повідомлення","IsRequired":true,"MaxLength":null,"Position":30,"SerializedFieldOptions":null}]');
CREATE TABLE "Roles" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Role" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (1,'Administrator','Administrator',100);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (2,'ApplicationOwner','Application owner',200);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (3,'ContentManager','Content manager',300);
CREATE TABLE "RolePermissions" (
	"RoleId" INTEGER NOT NULL,
	"PermissionId" INTEGER NOT NULL,
	CONSTRAINT "PK_RolePermission" PRIMARY KEY ("RoleId", "PermissionId"),
	CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id"),
	CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id")
);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (1,1);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (2,2);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,9);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,12);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,13);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,14);
CREATE TABLE "Relations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Relation" PRIMARY KEY AUTOINCREMENT,
	"MemberId" INTEGER NOT NULL,
	"PrimaryId" INTEGER NOT NULL,
	"ForeignId" INTEGER NOT NULL,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY ("PrimaryId") REFERENCES "Objects" ("Id"),
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY ("ForeignId") REFERENCES "Objects" ("Id")
);
CREATE TABLE "Properties" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Property" PRIMARY KEY AUTOINCREMENT,
	"ObjectId" INTEGER NOT NULL,
	"MemberId" INTEGER NOT NULL,
	"IntegerValue" INTEGER,
	"DecimalValue" REAL,
	"StringValueId" INTEGER,
	"DateTimeValue" TEXT,
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id"),
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id"),
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id")
);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (1,1,1,NULL,NULL,9,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (2,1,2,NULL,NULL,10,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (3,1,3,NULL,NULL,11,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (4,1,4,NULL,NULL,12,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (5,1,5,NULL,NULL,13,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (6,2,1,NULL,NULL,14,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (7,2,2,NULL,NULL,15,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (8,2,3,NULL,NULL,16,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (9,2,4,NULL,NULL,17,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (10,2,5,NULL,NULL,18,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (11,3,1,NULL,NULL,19,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (12,3,2,NULL,NULL,20,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (13,3,3,NULL,NULL,21,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (14,3,4,NULL,NULL,22,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (15,3,5,NULL,NULL,23,NULL);
CREATE TABLE "Products" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Product" PRIMARY KEY AUTOINCREMENT,
	"CategoryId" INTEGER NOT NULL,
	"Url" TEXT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"DescriptionId" INTEGER NOT NULL,
	"Price" REAL,
	"TitleId" INTEGER NOT NULL,
	"MetaDescriptionId" INTEGER NOT NULL,
	"MetaKeywordsId" INTEGER NOT NULL,
	CONSTRAINT "FK_Product_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_DescriptionId" FOREIGN KEY("DescriptionId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_TitleId" FOREIGN KEY("TitleId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaDescriptionId" FOREIGN KEY("MetaDescriptionId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Product_Dictionary_MetaKeywordsId" FOREIGN KEY("MetaKeywordsId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Positions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Position" PRIMARY KEY AUTOINCREMENT,
	"CartId" INTEGER NOT NULL,
	"ProductId" INTEGER NOT NULL,
	CONSTRAINT "FK_Position_Cart_CartId" FOREIGN KEY("CartId") REFERENCES "Carts" ("Id"),
	CONSTRAINT "FK_Position_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products" ("Id")
);
CREATE TABLE "Photos" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Photo" PRIMARY KEY AUTOINCREMENT,
	"ProductId" INTEGER NOT NULL,
	"Filename" TEXT NOT NULL,
	"IsCover" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Photo_Product_ProductId" FOREIGN KEY("ProductId") REFERENCES "Products" ("Id")
);
CREATE TABLE "Permissions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Permission" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (1,'BrowseBackend','Browse backend',1);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (2,'DoEverything','Do everything',100);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (3,'BrowsePermissions','Browse permissions',200);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (4,'BrowseRoles','Browse roles',210);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (5,'BrowseUsers','Browse users',220);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (6,'BrowseConfigurations','Browse configurations',300);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (7,'BrowseCultures','Browse cultures',400);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (8,'BrowseEndpoints','Browse endpoints',500);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (9,'BrowseObjects','Browse objects',600);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (10,'BrowseDataTypes','Browse data types',610);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (11,'BrowseClasses','Browse classes',620);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (12,'BrowseMenus','Browse menus',700);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (13,'BrowseForms','Browse forms',800);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (14,'BrowseFileManager','Browse file manager',900);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (15,'BrowseViews','Browse views',1000);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (16,'BrowseStyles','Browse styles',1010);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (17,'BrowseScripts','Browse scripts',1020);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (18,'BrowseBundles','Browse bundles',1030);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (19,'BrowseCatalogs','Browse catalogs',1100);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (20,'BrowseCategories','Browse categories',1110);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (21,'BrowseProducts','Browse products',1120);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (22,'BrowseCarts','Browse carts',1130);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (23,'BrowseOrderStates','Browse order states',1140);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (24,'BrowsePaymentMethods','Browse payment methods',1150);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (25,'BrowseDeliveryMethods','Browse delivery methods',1160);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (26,'BrowseOrders','Browse orders',1170);
CREATE TABLE "PaymentMethods" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_PaymentMethod" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_PaymentMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Orders" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Order" PRIMARY KEY AUTOINCREMENT,
	"OrderStateId" INTEGER NOT NULL,
	"PaymentMethodId" INTEGER NOT NULL,
	"DeliveryMethodId" INTEGER NOT NULL,
	"CustomerFirstName" TEXT NOT NULL,
	"CustomerLastName" TEXT,
	"CustomerPhone" TEXT NOT NULL,
	"CustomerEmail" TEXT,
	"CustomerAddress" TEXT,
	"Note" TEXT,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_Order_OrderState_OrderStateId" FOREIGN KEY("OrderStateId") REFERENCES "OrderStates" ("Id"),
	CONSTRAINT "FK_Order_PaymentMethod_PaymentMethodId" FOREIGN KEY("PaymentMethodId") REFERENCES "PaymentMethods" ("Id"),
	CONSTRAINT "FK_Order_DeliveryMethod_DeliveryMethodId" FOREIGN KEY("DeliveryMethodId") REFERENCES "DeliveryMethods" ("Id")
);
CREATE TABLE "OrderStates" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_OrderState" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_OrderState_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Objects" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Object" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	CONSTRAINT "FK_Object_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Objects` (Id,ClassId) VALUES (1,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (2,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (3,2);
CREATE TABLE "Menus" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Menu" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Menus` (Id,Code,NameId) VALUES (1,'Main',1);
CREATE TABLE "MenuItems" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_MenuItem" PRIMARY KEY AUTOINCREMENT,
	"MenuId" INTEGER,
	"MenuItemId" INTEGER,
	"NameId" INTEGER NOT NULL,
	"Url" TEXT,
	"Position" INTEGER,
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus" ("Id"),
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems" ("Id"),
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (1,1,NULL,2,'/',10);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (2,1,NULL,3,'/about-me',20);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (3,1,NULL,4,'/contacts',30);
CREATE TABLE "Members" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Member" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	"TabId" INTEGER,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER,
	"PropertyDataTypeId" INTEGER,
	"IsPropertyLocalizable" INTEGER,
	"IsPropertyVisibleInList" INTEGER,
	"RelationClassId" INTEGER,
	"IsRelationSingleParent" INTEGER,
  "MinRelatedObjectsNumber" INTEGER,
  "MaxRelatedObjectsNumber" INTEGER,
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id"),
	CONSTRAINT "FK_Member_Tab_TabId" FOREIGN KEY("TabId") REFERENCES "Tabs" ("Id"),
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY("PropertyDataTypeId") REFERENCES "DataTypes" ("Id"),
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (1,1,NULL,'Url','URL',1,1,0,1,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (2,1,NULL,'Content','Content',10,3,1,0,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (3,1,1,'Title','Title',1000,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (4,1,1,'MetaDescription','META description',1010,1,1,0,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (5,1,1,'MetaKeywords','META keywords',1020,1,1,0,NULL,NULL,NULL,NULL);
CREATE TABLE "Localizations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Localization" PRIMARY KEY AUTOINCREMENT,
	"DictionaryId" INTEGER NOT NULL,
	"CultureId" INTEGER NOT NULL,
	"Value" TEXT,
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY ("DictionaryId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id")
);
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (1,1,2,'Main');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (2,1,3,'Главное');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (3,1,4,'Головне');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (4,2,2,'Home');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (5,2,3,'Главная');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (6,2,4,'Головна');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (7,3,2,'About me');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (8,3,3,'Обо мне');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (9,3,4,'Про мене');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (10,4,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (11,4,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (12,4,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (13,5,2,'Feedback');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (14,5,3,'Обратная связь');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (15,5,4,'Зворотний зв’язок');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (16,6,2,'Your name');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (17,6,3,'Ваше имя');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (18,6,4,'Ваше ім’я');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (19,7,2,'Your email');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (20,7,3,'Ваша электронная почта');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (21,7,4,'Ваша електронна пошта');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (22,8,2,'Your message');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (23,8,3,'Ваше сообщение');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (24,8,4,'Ваше повідомлення');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (25,9,1,'/');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (26,10,2,'<h1>Your Personal Website</h1><p>Hello! This is your personal website, it is based on the <a href="http://platformus.net/" target="_blank" rel="noopener">Platformus</a> content management system. You can manage it (create pages, menu items, forms and so on) using the <a href="/backend">backend</a>. Please use the username and password specified during the installation to sign in (it is &ldquo;admin@platformus.net&rdquo; and &ldquo;admin&rdquo; by default).</p><p>Please use the <a href="http://docs.platformus.net/" target="_blank" rel="noopener">documentation</a> to learn more about Platformus and how to use it. There are several examples that could be useful for the beginners. Also, you can get help in our <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">chat</a>.</p><p>Have a nice work!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (27,10,3,'<h1>Ваш персональный веб-сайт</h1><p>Здравствуйте! Это ваш персональный веб-сайт, он работает на базе системы управления содержимым &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Вы можете управлять им (создавать страницы, элементы меню, формы и так далее) с помощью <a href="/backend">бекенда</a>. Для входа используйте, пожалуйста, имя пользователя и пароль, указанные при установке (по умолчанию это &laquo;admin@platformus.net&raquo; и &laquo;admin&raquo; соответственно).</p><p>Чтобы узнать больше о Платформусе и о том, как им пользоваться, пожалуйста, воспользуйтесь <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацией</a>, там есть несколько примеров, которые пригодятся начинающим. При возникновении сложностей или вопросов вы можете обратиться в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, где вам обязательно помогут.</p><p>Приятной работы!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (28,10,4,'<h1>Ваш персональний веб-сайт</h1><p>Вітаємо! Це ваш персональний веб-сайт, він працює на базі системи керування вмістом &laquo;<a href="http://platformus.net/" target="_blank" rel="noopener">Платформус</a>&raquo;. Ви можете керувати ним (створювати сторінки, елементи меню, форми і так далі) за допомогою <a href="/backend">бекенду</a>. Для входу використовуйте, будь ласка, ім&rsquo;я користувача і пароль, вказані під час установки (за замовчуванням це &laquo;admin@platformus.net&raquo; і &laquo;admin&raquo; відповідно).</p><p>Щоб дізнатися більше про Платформус і про те, як ним користуватися, будь ласка, скористайтеся <a href="http://docs.platformus.net/" target="_blank" rel="noopener">документацією</a>, там є декілька прикладів, що стануть у нагоді початківцям. При виникненні труднощів або питань ви можете звернутися в наш <a href="https://gitter.im/Platformus/Platformus" target="_blank" rel="noopener">чат</a>, де вам обов&rsquo;язково допоможуть.</p><p>Приємної роботи!</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (29,11,2,'Your Personal Website');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (30,11,3,'Ваш персональный веб-сайт');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (31,11,4,'Ваш персональний веб-сайт');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (32,12,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (33,12,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (34,12,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (35,13,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (36,13,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (37,13,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (38,14,1,'/about-me');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (39,15,2,'<h1>About Me</h1><p>Tell us about yourself in a few words. You can add photos or videos here.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (40,15,3,'<h1>Обо мне</h1><p>Расскажите о себе в нескольких словах. Вы можете добавить сюда фотографии или видео.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (41,15,4,'<h1>Про мене</h1><p>Розкажіть про себе в кількох словах. Ви можете додати сюди фотографії або відео.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (42,16,2,'About Me');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (43,16,3,'Обо мне');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (44,16,4,'Про мене');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (45,17,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (46,17,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (47,17,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (48,18,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (49,18,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (50,18,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (51,19,1,'/contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (52,20,2,'<h1>Contacts</h1><p>Add your contacts on this page. Phone number, messengers, social links. The feedback form below (by the way, you can edit or move it to a different place) allows your visitors to write you directly from the website, just don&rsquo;t forget to specify the email address for the messages.</p><h2>Feedback from</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (53,20,3,'<h1>Контакты</h1><p>Добавьте свои контакты на этой странице. Телефонный номер, мессенджеры, ссылки на социальные сети. Форма обратной связи, расположенная ниже (кстати, вы можете ее изменить или перенести в другое место), поможет посетителям написать вам сообщение прямо с сайта, лишь укажите для этого адрес, на который нужно присылать сообщения.</p><h2>Форма обратной связи</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (54,20,4,'<h1>Контакти</h1><p>Додайте свої контакти на цій сторінці. Номер телефону, месенджери, посилання на соціальні мережі. Форма зворотного зв&rsquo;язку, розташована нижче (до речі, ви можете її змінити або перенести в інше місце), допоможе відвідувачам написати вам повідомлення прямо з сайту, лише вкажіть для цього адресу, на яку потрібно надсилати повідомлення.</p><h2>Форма зворотного зв&rsquo;язку</h2>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (55,21,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (56,21,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (57,21,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (58,22,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (59,22,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (60,22,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (61,23,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (62,23,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (63,23,4,'');
CREATE TABLE "Forms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Form" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"ProduceCompletedForms" INTEGER NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Forms` (Id,Code,NameId,ProduceCompletedForms,CSharpClassName,Parameters) VALUES (1,'Feedback',5,1,'Platformus.Forms.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/contacts');
CREATE TABLE "Files" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_File" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"Size" INTEGER NOT NULL
);
CREATE TABLE "Fields" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Field" PRIMARY KEY AUTOINCREMENT,
	"FormId" INTEGER NOT NULL,
	"FieldTypeId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"IsRequired" INTEGER NOT NULL,
	"MaxLength" INTEGER,
	"Position" INTEGER,
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id"),
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY ("FieldTypeId") REFERENCES "FieldTypes" ("Id"),
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (1,1,1,'Name',6,1,NULL,10);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (2,1,1,'Email',7,1,NULL,20);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (3,1,2,'Message',8,1,NULL,30);
CREATE TABLE "FieldTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_FieldType" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (1,'TextBox','Text box',1);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (2,'TextArea','Text area',2);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (3,'Checkbox','Checkbox',3);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (4,'RadioButtonList','Radio button list',4);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (5,'DropDownList','Drop down list',5);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (6,'FileUpload','File upload',6);
CREATE TABLE "FieldOptions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_FieldOption" PRIMARY KEY AUTOINCREMENT,
	"FieldId" INTEGER NOT NULL,
	"ValueId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id"),
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY ("ValueId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Endpoints" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Endpoint" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"UrlTemplate" TEXT,
	"Position" INTEGER,
	"DisallowAnonymous" INTEGER NOT NULL,
	"SignInUrl" TEXT,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT
);
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (1,'Default','{*url}',1000,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=RegularPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (2,'Contacts','contacts',10,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=ContactsPage;UseCaching=true');
CREATE TABLE "EndpointPermissions" (
	"EndpointId" INTEGER NOT NULL,
	"PermissionId" INTEGER NOT NULL,
	CONSTRAINT "PK_EndpointPermission" PRIMARY KEY ("EndpointId", "PermissionId"),
	CONSTRAINT "FK_EndpointPermission_Endpoint_EndpointId" FOREIGN KEY ("EndpointId") REFERENCES "Endpoints" ("Id"),
	CONSTRAINT "FK_EndpointPermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id")
);
CREATE TABLE "Dictionaries" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Dictionary" PRIMARY KEY AUTOINCREMENT
);
INSERT INTO `Dictionaries` (Id) VALUES (1);
INSERT INTO `Dictionaries` (Id) VALUES (2);
INSERT INTO `Dictionaries` (Id) VALUES (3);
INSERT INTO `Dictionaries` (Id) VALUES (4);
INSERT INTO `Dictionaries` (Id) VALUES (5);
INSERT INTO `Dictionaries` (Id) VALUES (6);
INSERT INTO `Dictionaries` (Id) VALUES (7);
INSERT INTO `Dictionaries` (Id) VALUES (8);
INSERT INTO `Dictionaries` (Id) VALUES (9);
INSERT INTO `Dictionaries` (Id) VALUES (10);
INSERT INTO `Dictionaries` (Id) VALUES (11);
INSERT INTO `Dictionaries` (Id) VALUES (12);
INSERT INTO `Dictionaries` (Id) VALUES (13);
INSERT INTO `Dictionaries` (Id) VALUES (14);
INSERT INTO `Dictionaries` (Id) VALUES (15);
INSERT INTO `Dictionaries` (Id) VALUES (16);
INSERT INTO `Dictionaries` (Id) VALUES (17);
INSERT INTO `Dictionaries` (Id) VALUES (18);
INSERT INTO `Dictionaries` (Id) VALUES (19);
INSERT INTO `Dictionaries` (Id) VALUES (20);
INSERT INTO `Dictionaries` (Id) VALUES (21);
INSERT INTO `Dictionaries` (Id) VALUES (22);
INSERT INTO `Dictionaries` (Id) VALUES (23);
CREATE TABLE "DeliveryMethods" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DeliveryMethod" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_DeliveryMethod_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "DataTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataType" PRIMARY KEY AUTOINCREMENT,
	"StorageDataType" TEXT NOT NULL,
	"JavaScriptEditorClassName" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (1,'string','singleLinePlainText','Single line plain text',1);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (2,'string','multilinePlainText','Multiline plain text',2);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (3,'string','html','Html',3);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (4,'integer','integerNumber','Integer number',4);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (5,'decimal','decimalNumber','Decimal number',5);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (6,'integer','booleanFlag','Boolean flag',6);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (7,'string','image','Image',7);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (8,'datetime','date','Date',8);
CREATE TABLE "DataTypeParameters" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataTypeParameter" PRIMARY KEY AUTOINCREMENT,
	"DataTypeId" INT NOT NULL,
	"JavaScriptEditorClassName" TEXT NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameter_DataType_DataTypeId" FOREIGN KEY("DataTypeId") REFERENCES "DataTypes" ("Id")
);
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (1,1,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (2,1,'numericTextBox','MaxLength','Max length');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (4,2,'numericTextBox','MaxLength','Max length');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (5,7,'numericTextBox','Width','Width');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (6,7,'numericTextBox','Height','Height');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (7,8,'checkbox','IsRequired','Is required');
CREATE TABLE "DataTypeParameterValues" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataTypeParameterValue" PRIMARY KEY AUTOINCREMENT,
	"DataTypeParameterId" INT NOT NULL,
	"MemberId" INT NOT NULL,
	"Value" TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameterValue_DataTypeParameter_DataTypeParameterId" FOREIGN KEY("DataTypeParameterId") REFERENCES "DataTypeParameters" ("Id"),
	CONSTRAINT "FK_DataTypeParameterValue_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members" ("Id")
);
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (1,1,1,'true');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (2,2,1,'128');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (3,1,3,'false');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (4,2,3,'128');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (5,1,4,'false');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (6,2,4,'512');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (7,1,5,'false');
INSERT INTO `DataTypeParameterValues` (Id,DataTypeParameterId,MemberId,Value) VALUES (8,2,5,'256');
CREATE TABLE "DataSources" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataSource" PRIMARY KEY AUTOINCREMENT,
	"EndpointId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_DataSource_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id")
);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (1,1,'Page','Platformus.Domain.Frontend.DataSources.PageObjectDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (2,2,'Page','Platformus.Domain.Frontend.DataSources.PageObjectDataSource',NULL);
CREATE TABLE "Cultures" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Culture" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"IsNeutral" INTEGER NOT NULL,
	"IsFrontendDefault" INTEGER NOT NULL,
	"IsBackendDefault" INTEGER NOT NULL
);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (1,'__','Neutral',1,0,0);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (2,'en','English',0,1,1);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (3,'ru','Русский',0,0,0);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsFrontendDefault,IsBackendDefault) VALUES (4,'uk','Українська',0,0,0);
CREATE TABLE "Credentials" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Credential" PRIMARY KEY AUTOINCREMENT,
	"UserId" INTEGER NOT NULL,
	"CredentialTypeId" INTEGER NOT NULL,
	"Identifier" TEXT NOT NULL,
	"Secret" TEXT,
	"Extra" TEXT,
	CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id"),
	CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY ("CredentialTypeId") REFERENCES "CredentialTypes" ("Id")
);
INSERT INTO `Credentials` (Id,UserId,CredentialTypeId,Identifier,Secret,Extra) VALUES (1,1,1,'admin@platformus.net','8lE3xN2Ijiv/Y/aIGwaZLrbcqrt/1jDmzPTdudKbVD0=','0O/ZGwhScZRGbsmiUEckOg==');
CREATE TABLE "CredentialTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CredentialType" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `CredentialTypes` (Id,Code,Name,Position) VALUES (1,'Email','Email',1);
CREATE TABLE "Configurations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Configuration" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL
);
INSERT INTO `Configurations` (Id,Code,Name) VALUES (1,'Email','Email');
INSERT INTO `Configurations` (Id,Code,Name) VALUES (2,'Globalization','Globalization');
CREATE TABLE "CompletedForms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CompletedForm" PRIMARY KEY AUTOINCREMENT,
	"FormId" INTEGER NOT NULL,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_CompletedForm_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id")
);
CREATE TABLE "CompletedFields" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CompletedField" PRIMARY KEY AUTOINCREMENT,
	"CompletedFormId" INTEGER NOT NULL,
	"FieldId" INTEGER NOT NULL,
	"Value" TEXT,
	CONSTRAINT "FK_CompletedField_CompletedForm_CompletedFormId" FOREIGN KEY ("CompletedFormId") REFERENCES "CompletedForms" ("Id")
	CONSTRAINT "FK_CompletedField_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id")
);
CREATE TABLE "Classes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Class" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"PluralizedName" TEXT NOT NULL,
	"IsAbstract" INTEGER NOT NULL,
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (1,NULL,'Page','Page','Pages',1);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (2,1,'RegularPage','Regular Page','Regular Pages',0);
CREATE TABLE "Categories" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Category" PRIMARY KEY AUTOINCREMENT,
	"CategoryId" INTEGER,
	"NameId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Category_Category_CategoryId" FOREIGN KEY("CategoryId") REFERENCES "Categories" ("Id"),
	CONSTRAINT "FK_Category_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Catalogs" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Catalog" PRIMARY KEY AUTOINCREMENT,
	"CatalogId" INTEGER,
	"Url" TEXT,
	"NameId" INTEGER NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
  "Parameters" TEXT,
	"Position" INTEGER,
	CONSTRAINT "FK_Catalog_Catalog_CatalogId" FOREIGN KEY("CatalogId") REFERENCES "Catalogs" ("Id"),
	CONSTRAINT "FK_Catalog_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Carts" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Cart" PRIMARY KEY AUTOINCREMENT,
	"OrderId" INTEGER,
	"ClientSideId" TEXT NOT NULL,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_Cart_Order_OrderId" FOREIGN KEY("OrderId") REFERENCES "Orders" ("Id")
);
COMMIT;
