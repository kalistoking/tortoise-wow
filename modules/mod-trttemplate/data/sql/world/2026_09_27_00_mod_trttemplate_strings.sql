-- mod-trttemplate: the module's texts.
--
-- module_string holds the default (enUS) text, module_string_locale one row per other locale
-- (1 koKR, 2 frFR, 3 deDE, 4 zhCN, 5 zhTW, 6 esES, 7 esMX, 8 ruRU). C++ reads them with
-- sObjectMgr.GetModuleString("mod-trttemplate", id, localeIndex); a locale without a row gets
-- the default.
--
-- Idempotent: the module's own rows are deleted and written again. The migration runner records
-- a file by its content's hash, so an edited file runs again -- this one may.

DELETE FROM `module_string` WHERE `module` = 'mod-trttemplate';
INSERT INTO `module_string` (`module`, `id`, `content_default`) VALUES
('mod-trttemplate', 1, '[mod-trttemplate] module loaded: %u greeting(s) in the database.'),
('mod-trttemplate', 2, 'mod-trttemplate says: %s');

DELETE FROM `module_string_locale` WHERE `module` = 'mod-trttemplate';
INSERT INTO `module_string_locale` (`module`, `id`, `locale`, `content`) VALUES
('mod-trttemplate', 2, 3, 'mod-trttemplate sagt: %s');
