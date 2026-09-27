-- mod-trttemplate: a table the module owns.
--
-- A module's own table is named after the module, so it never meets the core's. It is created
-- only if missing, never dropped: a later change to its shape goes into a new file (ALTER TABLE),
-- and the rows a server admin adds survive every start.
--
-- Idempotent: the module's example rows are written by id and written again on a re-run.

CREATE TABLE IF NOT EXISTS `mod_trttemplate_greeting` (
  `id` int unsigned NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

DELETE FROM `mod_trttemplate_greeting` WHERE `id` IN (1, 2);
INSERT INTO `mod_trttemplate_greeting` (`id`, `text`) VALUES
(1, 'Hello from a module table.'),
(2, 'This line came from the world database.');
