/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     14/06/2024 22.35.05                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_GURU_MENGAMPU_MATA_PEL') then
    alter table GURU
       delete foreign key FK_GURU_MENGAMPU_MATA_PEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MATA_PEL_MENGAMPU2_GURU') then
    alter table MATA_PELAJARAN
       delete foreign key FK_MATA_PEL_MENGAMPU2_GURU
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MATA_PEL_MENYELENG_UJIAN_AK') then
    alter table MATA_PELAJARAN
       delete foreign key FK_MATA_PEL_MENYELENG_UJIAN_AK
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MATA_PEL_TERDAFTAR_SISWA') then
    alter table MATA_PELAJARAN
       delete foreign key FK_MATA_PEL_TERDAFTAR_SISWA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UJIAN_AK_MENYELENG_MATA_PEL') then
    alter table UJIAN_AKHIR_SEMESTER
       delete foreign key FK_UJIAN_AK_MENYELENG_MATA_PEL
end if;

drop index if exists GURU.MENGAMPU_FK;

drop index if exists GURU.GURU_PK;

drop table if exists GURU;

drop index if exists MATA_PELAJARAN.MENYELENGGARAKAN2_FK;

drop index if exists MATA_PELAJARAN.MENGAMPU2_FK;

drop index if exists MATA_PELAJARAN.TERDAFTAR_FK;

drop index if exists MATA_PELAJARAN.MATA_PELAJARAN_PK;

drop table if exists MATA_PELAJARAN;

drop index if exists SISWA.SISWA_PK;

drop table if exists SISWA;

drop index if exists UJIAN_AKHIR_SEMESTER.MENYELENGGARAKAN_FK;

drop index if exists UJIAN_AKHIR_SEMESTER.UJIAN_AKHIR_SEMESTER_PK;

drop table if exists UJIAN_AKHIR_SEMESTER;

/*==============================================================*/
/* Table: GURU                                                  */
/*==============================================================*/
create table GURU 
(
   NUPTK                varchar(16)                    not null,
   KODE_MAPEL           varchar(10)                    not null,
   NAMA                 varchar(30)                    null,
   constraint PK_GURU primary key (NUPTK)
);

/*==============================================================*/
/* Index: GURU_PK                                               */
/*==============================================================*/
create unique index GURU_PK on GURU (
NUPTK ASC
);

/*==============================================================*/
/* Index: MENGAMPU_FK                                           */
/*==============================================================*/
create index MENGAMPU_FK on GURU (
KODE_MAPEL ASC
);

/*==============================================================*/
/* Table: MATA_PELAJARAN                                        */
/*==============================================================*/
create table MATA_PELAJARAN 
(
   KODE_MAPEL           varchar(10)                    not null,
   NISN                 varchar(10)                    null,
   NUPTK                varchar(16)                    null,
   ID_UAS               varchar(10)                    null,
   NAMA_MAPEL           varchar(50)                    null,
   JAM_PEMBELAJARAN     integer                        null,
   constraint PK_MATA_PELAJARAN primary key (KODE_MAPEL)
);

/*==============================================================*/
/* Index: MATA_PELAJARAN_PK                                     */
/*==============================================================*/
create unique index MATA_PELAJARAN_PK on MATA_PELAJARAN (
KODE_MAPEL ASC
);

/*==============================================================*/
/* Index: TERDAFTAR_FK                                          */
/*==============================================================*/
create index TERDAFTAR_FK on MATA_PELAJARAN (
NISN ASC
);

/*==============================================================*/
/* Index: MENGAMPU2_FK                                          */
/*==============================================================*/
create index MENGAMPU2_FK on MATA_PELAJARAN (
NUPTK ASC
);

/*==============================================================*/
/* Index: MENYELENGGARAKAN2_FK                                  */
/*==============================================================*/
create index MENYELENGGARAKAN2_FK on MATA_PELAJARAN (
ID_UAS ASC
);

/*==============================================================*/
/* Table: SISWA                                                 */
/*==============================================================*/
create table SISWA 
(
   NISN                 varchar(10)                    not null,
   NAMA                 varchar(30)                    null,
   TTL                  varchar(20)                    null,
   KELAS                varchar(10)                    null,
   EMAIL                varchar(10)                    null,
   constraint PK_SISWA primary key (NISN)
);

/*==============================================================*/
/* Index: SISWA_PK                                              */
/*==============================================================*/
create unique index SISWA_PK on SISWA (
NISN ASC
);

/*==============================================================*/
/* Table: UJIAN_AKHIR_SEMESTER                                  */
/*==============================================================*/
create table UJIAN_AKHIR_SEMESTER 
(
   ID_UAS               varchar(10)                    not null,
   KODE_MAPEL           varchar(10)                    not null,
   TANGGAL              date                           null,
   WAKTU                time                           null,
   RUANG                varchar(10)                    null,
   constraint PK_UJIAN_AKHIR_SEMESTER primary key (ID_UAS)
);

/*==============================================================*/
/* Index: UJIAN_AKHIR_SEMESTER_PK                               */
/*==============================================================*/
create unique index UJIAN_AKHIR_SEMESTER_PK on UJIAN_AKHIR_SEMESTER (
ID_UAS ASC
);

/*==============================================================*/
/* Index: MENYELENGGARAKAN_FK                                   */
/*==============================================================*/
create index MENYELENGGARAKAN_FK on UJIAN_AKHIR_SEMESTER (
KODE_MAPEL ASC
);

alter table GURU
   add constraint FK_GURU_MENGAMPU_MATA_PEL foreign key (KODE_MAPEL)
      references MATA_PELAJARAN (KODE_MAPEL)
      on update restrict
      on delete restrict;

alter table MATA_PELAJARAN
   add constraint FK_MATA_PEL_MENGAMPU2_GURU foreign key (NUPTK)
      references GURU (NUPTK)
      on update restrict
      on delete restrict;

alter table MATA_PELAJARAN
   add constraint FK_MATA_PEL_MENYELENG_UJIAN_AK foreign key (ID_UAS)
      references UJIAN_AKHIR_SEMESTER (ID_UAS)
      on update restrict
      on delete restrict;

alter table MATA_PELAJARAN
   add constraint FK_MATA_PEL_TERDAFTAR_SISWA foreign key (NISN)
      references SISWA (NISN)
      on update restrict
      on delete restrict;

alter table UJIAN_AKHIR_SEMESTER
   add constraint FK_UJIAN_AK_MENYELENG_MATA_PEL foreign key (KODE_MAPEL)
      references MATA_PELAJARAN (KODE_MAPEL)
      on update restrict
      on delete restrict;

