/*==============================================================*/
/* Table: ACTIVITY                                              */
/*==============================================================*/
create table ACTIVITY (
   ACTIVITY_ID          INTEGER                 not null,
   USER_ID              INTEGER                 null,
   MOVIE_ID             INTEGER                 null,
   DTTM                 DATE                 not null,
   constraint PK_ACTIVITY primary key (ACTIVITY_ID)
);

/*==============================================================*/
/* Index: ACTIVITY_PK                                           */
/*==============================================================*/
create unique index ACTIVITY_PK on ACTIVITY (
ACTIVITY_ID
);

/*==============================================================*/
/* Index: ACT_USR_FK                                            */
/*==============================================================*/
create  index ACT_USR_FK on ACTIVITY (
USER_ID
);

/*==============================================================*/
/* Index: ACT_MV_FK                                             */
/*==============================================================*/
create  index ACT_MV_FK on ACTIVITY (
MOVIE_ID
);

/*==============================================================*/
/* Table: MOVIE                                                 */
/*==============================================================*/
create table MOVIE (
   MOVIE_ID             INTEGER                 not null,
   PRODUCER_ID          INTEGER                 null,
   TYPE_ID              INTEGER                 null,
   RATINGS              INTEGER                 null,
   RELEASE_DATE         DATE                 not null,
   FILM_DESC            TEXT                 null,
   constraint PK_MOVIE primary key (MOVIE_ID)
);

/*==============================================================*/
/* Index: MOVIE_PK                                              */
/*==============================================================*/
create unique index MOVIE_PK on MOVIE (
MOVIE_ID
);

/*==============================================================*/
/* Index: MV_PRO_FK                                             */
/*==============================================================*/
create  index MV_PRO_FK on MOVIE (
PRODUCER_ID
);

/*==============================================================*/
/* Index: MV_TP_FK                                              */
/*==============================================================*/
create  index MV_TP_FK on MOVIE (
TYPE_ID
);

/*==============================================================*/
/* Table: PRODUCER                                              */
/*==============================================================*/
create table PRODUCER (
   PRODUCER_ID          INTEGER                 not null,
   STUDIO               TEXT                 not null,
   CREATOR              TEXT                 null,
   constraint PK_PRODUCER primary key (PRODUCER_ID)
);

/*==============================================================*/
/* Index: PRODUCER_PK                                           */
/*==============================================================*/
create unique index PRODUCER_PK on PRODUCER (
PRODUCER_ID
);

/*==============================================================*/
/* Table: TYPE                                                  */
/*==============================================================*/
create table TYPE (
   TYPE_ID              INTEGER                 not null,
   TYPE                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   constraint PK_TYPE primary key (TYPE_ID)
);

/*==============================================================*/
/* Index: TYPE_PK                                               */
/*==============================================================*/
create unique index TYPE_PK on TYPE (
TYPE_ID
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   USER_ID              INTEGER                 not null,
   NAME                 TEXT                 not null,
   SURNAME              TEXT                 not null,
   AGE                  INTEGER                 null,
   constraint PK_USER primary key (USER_ID)
);

/*==============================================================*/
/* Index: USER_PK                                               */
/*==============================================================*/
create unique index USER_PK on "USER" (
USER_ID
);

alter table ACTIVITY
   add constraint FK_ACTIVITY_ACT_MV_MOVIE foreign key (MOVIE_ID)
      references MOVIE (MOVIE_ID)
      on delete restrict on update restrict;

alter table ACTIVITY
   add constraint FK_ACTIVITY_ACT_USR_USER foreign key (USER_ID)
      references "USER" (USER_ID)
      on delete restrict on update restrict;

alter table MOVIE
   add constraint FK_MOVIE_MV_PRO_PRODUCER foreign key (PRODUCER_ID)
      references PRODUCER (PRODUCER_ID)
      on delete restrict on update restrict;

alter table MOVIE
   add constraint FK_MOVIE_MV_TP_TYPE foreign key (TYPE_ID)
      references TYPE (TYPE_ID)
      on delete restrict on update restrict;

insert into user values(1,'Jan','Nowak',21);
insert into user values(2,'Adam','Robak',32);
insert into user values(3,'Piotr','Kostrzewski',45);
insert into user values(4,'Krzysztof','Ibisz',56);
insert into user values(5,'Robert','Deniro',22);
insert into user values(6,'Micha³','Michalski',48);
insert into user values(7,'Stanis³aw','Wszywka',19);
insert into user values(8,'Michalina','Adamiakowa',62);
insert into user values(9,'Gustaw','Konopacek',29);
insert into user values(10,'Iwan','Komarenko',26);


insert into producer values(1,'Blue Sky Studios','SzonConery');
insert into producer values(2,'Columbia Pictures','MajkelDzekson');
insert into producer values(3,'Keystone Studios','KimPosible');
insert into producer values(4,'Bad Robot Productions','Putout');
insert into producer values(5,'Carolco Pictures','Tupak');
insert into producer values(6,'Marvel Studios','DzeniferFerlopes');
insert into producer values(7,'Universal Pictures','DzonyDeb');
insert into producer values(8,'Orion Pictures','KimKardaszjan');
insert into producer values(9,'Renegade Animation','SamuelElDzekson');
insert into producer values(10,'Touchstone Pictures','Kanikuly');

insert into type values(1,'Horror','Odmiana fantastyki polegaj¹ca na budowaniu œwiata przedstawionego na wzór rzeczywistoœci i praw ni¹ rz¹dz¹cych po to, aby wprowadziæ w jego obrêb zjawiska kwestionuj¹ce te prawa i nie daj¹ce siê wyt³umaczyæ bez odwo³ywania siê do zjawisk nadprzyrodzonych.');
insert into type values(2,'Akcji','Film sensacyjny, którego g³ównym zadaniem jest dostarczanie rozrywki widzom poprzez pokazywanie poœcigów samochodowych, strzelanin, bijatyk i innych scen kaskaderskich o du¿ym ³adunku napiêcia i emocji.');
insert into type values(3,'Komedia','Jeden z trzech, obok tragedii i dramatu w³aœciwego, gatunków dramatycznych. Komedie cechuje pogodny nastrój, komizm, najczêœciej ¿ywa akcja i szczêœliwe dla bohaterów zakoñczenie. Komedia rozwija³a siê ju¿ w staro¿ytnej Grecji i Rzymie. Przedstawia komicznie sytuacje i wady bohaterów.');
insert into type values(4,'Przygodowy','Film o akcji skonstruowanej z ci¹gu przygód protagonisty, charakteryzuj¹cy siê szybkim tempem akcji, brawurowymi rozwi¹zaniami fabularnymi oraz licznymi przeszkodami pokonywanymi przez bohaterów.');
insert into type values(5,'Dreszczowiec','rodzaj utworu sensacyjnego, powieœci, filmu lub serialu telewizyjnego, maj¹cego wywo³aæ u czytelnika b¹dŸ widza dreszcz emocji. Wykorzystuje on napiêcie, niepewnoœæ i tajemniczoœæ jako g³ówne elementy utworu.');

insert into movie values(1,1,1,9,now(), 'Amerykañski film fabularny (dramat) z 1994 roku, w re¿. Franka Darabonta z Timem Robbinsem i Morganem Freemanem w rolach g³ównych. Na podstawie opowiadania Stephena Kinga.');
insert into movie values(2,2,2,3,now(), ' amerykañski film fabularny z 1999 roku w re¿yserii Franka Darabonta, z Tomem Hanksem i Michaelem Duncanem w rolach g³ównych.Scenariusz filmu oparty jest na powieœci Stephena Kinga pod tym samym tytu³em.');
insert into movie values(3,3,3,7,now(), 'Amerykañski film gangsterski z 1974 roku w re¿yserii Francisa Forda Coppoli na podstawie scenariusza napisanego przez Francisa Forda Coppolê i Maria Puzo. Film jest jednoczeœnie sequelem i prequelem dla filmu Ojciec chrzestny. Pokazuje on jednoczeœnie losy rodziny Corleone po wydarzeniach z pierwszej czêœci filmu oraz losy m³odego Vita Corleone granego przez Roberta De Niro.');
insert into movie values(4,4,4,4,now(), 'Amerykañski film fabularny z 1975 roku w re¿yserii Miloša Formana, oparty na ksi¹¿ce Kena Keseya pod tym samym tytu³em wydanej w roku 1962.');
insert into movie values(5,5,5,5,now(), 'Amerykañski film fabularny z 1994 roku w re¿yserii Roberta Zemeckisa. Scenariusz fabu³y zosta³ oparty na powieœci o tym samym tytule Winstona Grooma. W tytu³ow¹ rolê wcieli³ siê tu Tom Hanks.');
insert into movie values(6,6,1,10,now(), 'Amerykañski dramat s¹dowy z 1957 roku, zrealizowany w oparciu o powsta³e dwa lata wczeœniej teatralne przedstawienie telewizyjne Reginalda Rose’a. Film opowiada historiê ³awy przysiêg³ych obraduj¹cej po procesie m³odego ch³opaka oskar¿onego o morderstwo. Spoœród dwunastu przysiêg³ych tylko jeden nie jest do koñca przekonany o winie oskar¿onego.');
insert into movie values(7,7,2,4,now(), 'Film fabularny produkcji amerykañskiej z 1997 roku, oparty na historycznym wydarzeniu – zatoniêciu „Titanica” w 1912 roku.');
insert into movie values(8,8,3,8,now(), 'Po latach odsiadki Franz Maurer wychodzi z wiêzienia i wkracza w now¹ Polskê, w której nic nie jest takie, jak zapamiêta³. Kto i co czeka na cz³owieka, który przez ostatnie æwieræ wieku… nie robi³ nic? Jak odnajdzie siê w œwiecie, w którym dawne zasady i lojalnoœæ przesta³y obowi¹zywaæ? Tego dowiemy siê, gdy los ponownie po³¹czy Franza i „Nowego”. Ich spotkanie zmieni wszystko.');
insert into movie values(9,9,4,1,now(), ' Amerykañsko-australijski horror z 2020 roku w re¿yserii Leigh Whannella. Film powsta³ na podstawie powieœci Herberta Georgea Wellsa pod tym samym tytu³em.');
insert into movie values(10,10,5,5,now(), 'Polski film z 2020 roku w re¿yserii Bartosza Kowalskiego. Jest to jeden z pierwszych polskich slasherów.');

insert into activity values(1,1,1,now());
insert into activity values(2,2,2,now());
insert into activity values(3,5,3,now());
insert into activity values(4,7,10,now());
insert into activity values(5,3,9,now());
insert into activity values(6,4,8,now());
insert into activity values(7,9,4,now());
insert into activity values(8,10,5,now());
insert into activity values(9,5,7,now());
insert into activity values(10,3,6,now());
insert into activity values(11,7,5,now());
insert into activity values(12,1,4,now());
insert into activity values(13,2,3,now());
insert into activity values(14,3,6,now());
insert into activity values(15,6,7,now());
insert into activity values(16,6,8,now());
insert into activity values(17,3,9,now());
insert into activity values(18,4,2,now());
insert into activity values(19,8,10,now());
insert into activity values(20,5,1,now());
