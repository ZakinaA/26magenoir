-- phpmyadmin sql dump

set sql_mode = "no_auto_value_on_zero";
start transaction;
set time_zone = "+00:00";

/*!40101 set @old_character_set_client=@@character_set_client */;
/*!40101 set @old_character_set_results=@@character_set_results */;
/*!40101 set @old_collation_connection=@@collation_connection */;
/*!40101 set names utf8mb4 */;

-- désactivation temporaire des contraintes de clés étrangères pour réinitialiser la base proprement
set foreign_key_checks = 0;

-- --------------------------------------------------------
-- 1. suppression des tables existantes
-- --------------------------------------------------------
drop table if exists `engin`;
drop table if exists `envoyer`;
drop table if exists `habiliter`;
drop table if exists `necessiter`;
drop table if exists `pompier`;
drop table if exists `caserne`;
drop table if exists `categoriegrade`;
drop table if exists `fonction`;
drop table if exists `grade`;
drop table if exists `intervention`;
drop table if exists `profession`;
drop table if exists `situation`;
drop table if exists `typeengin`;

-- --------------------------------------------------------
-- 2. création des tables
-- --------------------------------------------------------

create table `caserne` (
  `id_caserne` int(11) not null auto_increment,
  `nom` varchar(100) default null,
  `rue` varchar(255) default null,
  `copos` varchar(5) default null,
  `ville` varchar(100) default null,
  primary key (`id_caserne`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `categoriegrade` (
  `id_categoriegrade` int(11) not null auto_increment,
  `libelle` varchar(100) default null,
  primary key (`id_categoriegrade`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `engin` (
  `id_engin` int(11) not null auto_increment,
  `libelle` varchar(100) default null,
  `numeroordre` int(11) default null,
  `id_caserne` int(11) default null,
  `id_typeengin` int(11) default null,
  primary key (`id_engin`),
  key `fk_engin_caserne` (`id_caserne`),
  key `fk_engin_type` (`id_typeengin`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `envoyer` (
  `id_intervention` int(11) not null,
  `matricule` int(11) not null,
  primary key (`id_intervention`,`matricule`),
  key `fk_env_pompier` (`matricule`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `fonction` (
  `code_fonction` varchar(10) not null,
  `libelle` varchar(100) default null,
  primary key (`code_fonction`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `grade` (
  `id_grade` int(11) not null auto_increment,
  `libelle` varchar(100) default null,
  `id_categoriegrade` int(11) default null,
  primary key (`id_grade`),
  key `fk_grade_cat` (`id_categoriegrade`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `habiliter` (
  `matricule` int(11) not null,
  `code_fonction` varchar(10) not null,
  primary key (`matricule`,`code_fonction`),
  key `fk_hab_fonction` (`code_fonction`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `intervention` (
  `id_intervention` int(11) not null auto_increment,
  `lieu` varchar(255) default null,
  `date_inter` date default null,
  `heureappel` time default null,
  `heurearrive` time default null,
  `duree` time default null,
  primary key (`id_intervention`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `necessiter` (
  `id_intervention` int(11) not null,
  `code_situation` varchar(10) not null,
  `id_engin` int(11) not null,
  primary key (`id_intervention`,`code_situation`,`id_engin`),
  key `fk_nec_situation` (`code_situation`),
  key `fk_nec_engin` (`id_engin`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `pompier` (
  `matricule` int(11) not null auto_increment,
  `nom` varchar(50) default null,
  `prenom` varchar(50) default null,
  `datenaiss` date default null,
  `numerotel` varchar(15) default null,
  `numerobip` int(11) default null,
  `id_grade` int(11) default null,
  `id_caserne` int(11) default null,
  `id_profession` int(11) default null,
  primary key (`matricule`),
  key `fk_pompier_grade` (`id_grade`),
  key `fk_pompier_caserne` (`id_caserne`),
  key `fk_pompier_prof` (`id_profession`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `profession` (
  `id_profession` int(11) not null auto_increment,
  `libelle` varchar(100) default null,
  primary key (`id_profession`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `situation` (
  `code_situation` varchar(10) not null,
  `libelle` varchar(100) default null,
  primary key (`code_situation`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;

create table `typeengin` (
  `id_typeengin` int(11) not null auto_increment,
  `libelle` varchar(100) default null,
  primary key (`id_typeengin`)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_unicode_ci;


-- --------------------------------------------------------
-- 3. insertion des données de référence
-- --------------------------------------------------------

insert into `caserne` (`id_caserne`, `nom`, `rue`, `copos`, `ville`) values
(1, 'ifs', 'rue de la république', '14123', 'ifs'),
(2, 'lisieux', 'avenue georges pompidou', '14100', 'lisieux'),
(3, 'le hom', 'route de condé', '14220', 'le hom'),
(4, 'caen folie couvrechef', 'avenue de la folie', '14000', 'caen'),
(5, 'quimper', '10 avenue pompiers', '29000', 'quimper');

insert into `categoriegrade` (`id_categoriegrade`, `libelle`) values
(1, 'hommes du rang'),
(2, 'sous-officiers'),
(3, 'officiers');

insert into `grade` (`id_grade`, `libelle`, `id_categoriegrade`) values
(1, 'sapeur', 1),
(2, 'caporal', 1),
(3, 'sergent', 2),
(4, 'adjudant', 2),
(5, 'lieutenant', 3),
(6, 'capitaine', 3),
(7, 'commandant', 3);

insert into `profession` (`id_profession`, `libelle`) values
(1, 'artisan'),
(2, 'employé de mairie'),
(3, 'informaticien'),
(4, 'mécanicien'),
(5, 'sans profession');

insert into `fonction` (`code_fonction`, `libelle`) values
('cond_fpt', 'conducteur fourgon pompe-tonne'),
('cond_vsr', 'conducteur véhicule de secours routier'),
('equi_epa', 'equiper échelle pivotante automatique'),
('equi_inc', 'equipier incendie');

insert into `typeengin` (`id_typeengin`, `libelle`) values
(1, 'fourgon pompe-tonne (fpt)'),
(2, 'véhicule de secours routier (vsr)'),
(3, 'echelle pivotante automatique (epa)'),
(4, 'véhicule de secours et d''assistance aux victimes (vsav)');

insert into `situation` (`code_situation`, `libelle`) values
('avp', 'accident sur la voie publique'),
('inc', 'incendie de bâtiment'),
('sap', 'secours à personne');

insert into `engin` (`id_engin`, `libelle`, `numeroordre`, `id_caserne`, `id_typeengin`) values
(1, 'fpt 1 quimper', 1, 5, 1),
(2, 'vsr 1 quimper', 1, 5, 2),
(3, 'vsav 1 ifs', 1, 1, 4),
(4, 'fpt 1 lisieux', 1, 2, 1);


-- --------------------------------------------------------
-- 4. insertion des pompiers (données complétées)
-- --------------------------------------------------------

insert into `pompier` (`matricule`, `nom`, `prenom`, `datenaiss`, `numerotel`, `numerobip`, `id_grade`, `id_caserne`, `id_profession`) values
(1, 'leroy', 'pierrick', '1995-04-12', '0601020304', 101, 1, 1, 3),
(2, 'masson', 'bastien', '1992-08-22', '0611223344', 102, 2, 1, 4),
(3, 'duval', 'matthias', '1988-11-05', '0622334455', 103, 3, 4, 1),
(4, 'madji', 'walid', '1998-02-18', '0633445566', 104, 1, 4, 5),
(6, 'chauvel', 'jules', '1998-02-18', '0633445567', 106, 1, 1, 5),
(7, 'cauvin', 'nayah', '1998-02-18', '0633445568', 107, 1, 1, 5),
(8, 'traore', 'sylvain', '1985-06-30', '0644556677', 108, 5, 3, 2),
(9, 'bouleau', 'line', '1990-01-15', '0655667788', 109, 2, 3, 3),
(10, 'mancel', 'florianne', '1993-07-21', '0666778899', 110, 1, 2, 5),
(11, 'pontier', 'claire', '1987-12-05', '0677889900', 111, 4, 2, 1),
(12, 'baron', 'gwladys', '1996-03-30', '0688990011', 112, 1, 3, 4),
(13, 'pastor', 'lucas', '1991-09-14', '0699001122', 113, 2, 1, 2),
(14, 'bareau', 'mila', '1999-05-25', '0612345678', 114, 1, 1, 5),
-- intégration de robert dumontel d'après le cahier des charges
(986995, 'dumontel', 'robert', '1969-01-10', '02 98 56 85 42', 15, 6, 5, 2);


-- --------------------------------------------------------
-- 5. insertion des habilitations (robert dumontel)
-- --------------------------------------------------------

insert into `habiliter` (`matricule`, `code_fonction`) values
(986995, 'cond_fpt'),
(986995, 'cond_vsr'),
(986995, 'equi_epa'),
(986995, 'equi_inc');


-- --------------------------------------------------------
-- 6. insertion d'une intervention de test
-- --------------------------------------------------------

insert into `intervention` (`id_intervention`, `lieu`, `date_inter`, `heureappel`, `heurearrive`, `duree`) values
(1, '15 rue de brest, quimper', '2026-03-25', '14:30:00', '14:42:00', '02:15:00');

insert into `necessiter` (`id_intervention`, `code_situation`, `id_engin`) values
(1, 'inc', 1);

insert into `envoyer` (`id_intervention`, `matricule`) values
(1, 986995),
(1, 1),
(1, 2);


-- --------------------------------------------------------
-- 7. restauration des contraintes de clés étrangères
-- --------------------------------------------------------

alter table `engin`
  add constraint `fk_engin_caserne` foreign key (`id_caserne`) references `caserne` (`id_caserne`),
  add constraint `fk_engin_type` foreign key (`id_typeengin`) references `typeengin` (`id_typeengin`);

alter table `envoyer`
  add constraint `fk_env_inter` foreign key (`id_intervention`) references `intervention` (`id_intervention`),
  add constraint `fk_env_pompier` foreign key (`matricule`) references `pompier` (`matricule`);

alter table `grade`
  add constraint `fk_grade_cat` foreign key (`id_categoriegrade`) references `categoriegrade` (`id_categoriegrade`);

alter table `habiliter`
  add constraint `fk_hab_fonction` foreign key (`code_fonction`) references `fonction` (`code_fonction`),
  add constraint `fk_hab_pompier` foreign key (`matricule`) references `pompier` (`matricule`);

alter table `necessiter`
  add constraint `fk_nec_engin` foreign key (`id_engin`) references `engin` (`id_engin`),
  add constraint `fk_nec_inter` foreign key (`id_intervention`) references `intervention` (`id_intervention`),
  add constraint `fk_nec_situation` foreign key (`code_situation`) references `situation` (`code_situation`);

alter table `pompier`
  add constraint `fk_pompier_caserne` foreign key (`id_caserne`) references `caserne` (`id_caserne`),
  add constraint `fk_pompier_grade` foreign key (`id_grade`) references `grade` (`id_grade`),
  add constraint `fk_pompier_prof` foreign key (`id_profession`) references `profession` (`id_profession`);

set foreign_key_checks = 1;
commit;

/*!40101 set character_set_client=@old_character_set_client */;
/*!40101 set character_set_results=@old_character_set_results */;
/*!40101 set collation_connection=@old_collation_connection */;