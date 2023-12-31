PGDMP     6    ;                {            Films    15.1    15.1 E    O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            R           1262    24633    Films    DATABASE     {   CREATE DATABASE "Films" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Films";
                postgres    false            �            1259    32916    DatePrice2D    TABLE     �   CREATE TABLE public."DatePrice2D" (
    "Id" integer NOT NULL,
    "Date" timestamp without time zone[] NOT NULL,
    "Price" money[] NOT NULL
);
 !   DROP TABLE public."DatePrice2D";
       public         heap    postgres    false            �            1259    32915    DatePrice2D_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."DatePrice2D_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."DatePrice2D_Id_seq";
       public          postgres    false    228            S           0    0    DatePrice2D_Id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."DatePrice2D_Id_seq" OWNED BY public."DatePrice2D"."Id";
          public          postgres    false    227            �            1259    32925    DatePrice3D    TABLE     �   CREATE TABLE public."DatePrice3D" (
    "Id" integer NOT NULL,
    "Date" timestamp without time zone[] NOT NULL,
    "Price" money[] NOT NULL
);
 !   DROP TABLE public."DatePrice3D";
       public         heap    postgres    false            �            1259    32924    DatePrice3D_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."DatePrice3D_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."DatePrice3D_Id_seq";
       public          postgres    false    230            T           0    0    DatePrice3D_Id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."DatePrice3D_Id_seq" OWNED BY public."DatePrice3D"."Id";
          public          postgres    false    229            �            1259    24687    Film    TABLE       CREATE TABLE public."Film" (
    "Id" integer NOT NULL,
    "Title" character varying NOT NULL,
    "Description" character varying NOT NULL,
    "ReleaseDate" date NOT NULL,
    "Video" character varying NOT NULL,
    "Image" character varying,
    happy integer DEFAULT 0
);
    DROP TABLE public."Film";
       public         heap    postgres    false            �            1259    24719 
   Film_Genre    TABLE     j   CREATE TABLE public."Film_Genre" (
    "Genre" character varying NOT NULL,
    "Film" integer NOT NULL
);
     DROP TABLE public."Film_Genre";
       public         heap    postgres    false            �            1259    24718    Film_Genre_Film_seq    SEQUENCE     �   CREATE SEQUENCE public."Film_Genre_Film_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Film_Genre_Film_seq";
       public          postgres    false    220            U           0    0    Film_Genre_Film_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Film_Genre_Film_seq" OWNED BY public."Film_Genre"."Film";
          public          postgres    false    219            �            1259    32903    Film_Statistic    TABLE     v   CREATE TABLE public."Film_Statistic" (
    "Id" integer NOT NULL,
    "FilmId" integer NOT NULL,
    happy integer
);
 $   DROP TABLE public."Film_Statistic";
       public         heap    postgres    false            �            1259    32902    Film_Statistic_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Film_Statistic_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Film_Statistic_Id_seq";
       public          postgres    false    226            V           0    0    Film_Statistic_Id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Film_Statistic_Id_seq" OWNED BY public."Film_Statistic"."Id";
          public          postgres    false    225            �            1259    24686    Films_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Films_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Films_Id_seq";
       public          postgres    false    215            W           0    0    Films_Id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public."Films_Id_seq" OWNED BY public."Film"."Id";
          public          postgres    false    214            �            1259    24711    Genre    TABLE     G   CREATE TABLE public."Genre" (
    "Name" character varying NOT NULL
);
    DROP TABLE public."Genre";
       public         heap    postgres    false            �            1259    24703    News    TABLE     �   CREATE TABLE public."News" (
    "Id" integer NOT NULL,
    "Title" character varying NOT NULL,
    "TextContent" character varying NOT NULL,
    "PostDate" date NOT NULL,
    "Image" character varying NOT NULL
);
    DROP TABLE public."News";
       public         heap    postgres    false            �            1259    24702    News_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."News_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."News_Id_seq";
       public          postgres    false    217            X           0    0    News_Id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."News_Id_seq" OWNED BY public."News"."Id";
          public          postgres    false    216            �            1259    32872    Session    TABLE       CREATE TABLE public."Session" (
    "Id" integer NOT NULL,
    "FilmId" integer NOT NULL,
    "DateTime" timestamp without time zone NOT NULL,
    fear integer NOT NULL,
    happy integer NOT NULL,
    sad integer NOT NULL,
    neutral integer NOT NULL,
    "Login" character varying
);
    DROP TABLE public."Session";
       public         heap    postgres    false            �            1259    32871    Session_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Session_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Session_Id_seq";
       public          postgres    false    224            Y           0    0    Session_Id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Session_Id_seq" OWNED BY public."Session"."Id";
          public          postgres    false    223            �            1259    32826    User    TABLE     �   CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "Login" character varying(30) NOT NULL,
    "Password" character varying(30) NOT NULL,
    "Admin" boolean NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    32825    User_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_Id_seq";
       public          postgres    false    222            Z           0    0    User_Id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."User_Id_seq" OWNED BY public."User"."Id";
          public          postgres    false    221            �           2604    32919    DatePrice2D Id    DEFAULT     v   ALTER TABLE ONLY public."DatePrice2D" ALTER COLUMN "Id" SET DEFAULT nextval('public."DatePrice2D_Id_seq"'::regclass);
 A   ALTER TABLE public."DatePrice2D" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    32928    DatePrice3D Id    DEFAULT     v   ALTER TABLE ONLY public."DatePrice3D" ALTER COLUMN "Id" SET DEFAULT nextval('public."DatePrice3D_Id_seq"'::regclass);
 A   ALTER TABLE public."DatePrice3D" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    24690    Film Id    DEFAULT     i   ALTER TABLE ONLY public."Film" ALTER COLUMN "Id" SET DEFAULT nextval('public."Films_Id_seq"'::regclass);
 :   ALTER TABLE public."Film" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    24722    Film_Genre Film    DEFAULT     x   ALTER TABLE ONLY public."Film_Genre" ALTER COLUMN "Film" SET DEFAULT nextval('public."Film_Genre_Film_seq"'::regclass);
 B   ALTER TABLE public."Film_Genre" ALTER COLUMN "Film" DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    32906    Film_Statistic Id    DEFAULT     |   ALTER TABLE ONLY public."Film_Statistic" ALTER COLUMN "Id" SET DEFAULT nextval('public."Film_Statistic_Id_seq"'::regclass);
 D   ALTER TABLE public."Film_Statistic" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    24706    News Id    DEFAULT     h   ALTER TABLE ONLY public."News" ALTER COLUMN "Id" SET DEFAULT nextval('public."News_Id_seq"'::regclass);
 :   ALTER TABLE public."News" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    32875 
   Session Id    DEFAULT     n   ALTER TABLE ONLY public."Session" ALTER COLUMN "Id" SET DEFAULT nextval('public."Session_Id_seq"'::regclass);
 =   ALTER TABLE public."Session" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    32829    User Id    DEFAULT     h   ALTER TABLE ONLY public."User" ALTER COLUMN "Id" SET DEFAULT nextval('public."User_Id_seq"'::regclass);
 :   ALTER TABLE public."User" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    221    222    222            J          0    32916    DatePrice2D 
   TABLE DATA           >   COPY public."DatePrice2D" ("Id", "Date", "Price") FROM stdin;
    public          postgres    false    228   gL       L          0    32925    DatePrice3D 
   TABLE DATA           >   COPY public."DatePrice3D" ("Id", "Date", "Price") FROM stdin;
    public          postgres    false    230   �L       =          0    24687    Film 
   TABLE DATA           f   COPY public."Film" ("Id", "Title", "Description", "ReleaseDate", "Video", "Image", happy) FROM stdin;
    public          postgres    false    215   �L       B          0    24719 
   Film_Genre 
   TABLE DATA           7   COPY public."Film_Genre" ("Genre", "Film") FROM stdin;
    public          postgres    false    220   �M       H          0    32903    Film_Statistic 
   TABLE DATA           A   COPY public."Film_Statistic" ("Id", "FilmId", happy) FROM stdin;
    public          postgres    false    226   �M       @          0    24711    Genre 
   TABLE DATA           )   COPY public."Genre" ("Name") FROM stdin;
    public          postgres    false    218   �M       ?          0    24703    News 
   TABLE DATA           S   COPY public."News" ("Id", "Title", "TextContent", "PostDate", "Image") FROM stdin;
    public          postgres    false    217   
N       F          0    32872    Session 
   TABLE DATA           c   COPY public."Session" ("Id", "FilmId", "DateTime", fear, happy, sad, neutral, "Login") FROM stdin;
    public          postgres    false    224   O       D          0    32826    User 
   TABLE DATA           D   COPY public."User" ("Id", "Login", "Password", "Admin") FROM stdin;
    public          postgres    false    222   sO       [           0    0    DatePrice2D_Id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."DatePrice2D_Id_seq"', 1, false);
          public          postgres    false    227            \           0    0    DatePrice3D_Id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."DatePrice3D_Id_seq"', 1, false);
          public          postgres    false    229            ]           0    0    Film_Genre_Film_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Film_Genre_Film_seq"', 1, false);
          public          postgres    false    219            ^           0    0    Film_Statistic_Id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Film_Statistic_Id_seq"', 1, false);
          public          postgres    false    225            _           0    0    Films_Id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Films_Id_seq"', 17, true);
          public          postgres    false    214            `           0    0    News_Id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."News_Id_seq"', 47, true);
          public          postgres    false    216            a           0    0    Session_Id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Session_Id_seq"', 27, true);
          public          postgres    false    223            b           0    0    User_Id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_Id_seq"', 46, true);
          public          postgres    false    221            �           2606    32923    DatePrice2D DatePrice2D_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."DatePrice2D"
    ADD CONSTRAINT "DatePrice2D_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."DatePrice2D" DROP CONSTRAINT "DatePrice2D_pkey";
       public            postgres    false    228            �           2606    32932    DatePrice3D DatePrice3D_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."DatePrice3D"
    ADD CONSTRAINT "DatePrice3D_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."DatePrice3D" DROP CONSTRAINT "DatePrice3D_pkey";
       public            postgres    false    230            �           2606    24726    Film_Genre Film_Genre_pk 
   CONSTRAINT     g   ALTER TABLE ONLY public."Film_Genre"
    ADD CONSTRAINT "Film_Genre_pk" PRIMARY KEY ("Genre", "Film");
 F   ALTER TABLE ONLY public."Film_Genre" DROP CONSTRAINT "Film_Genre_pk";
       public            postgres    false    220    220            �           2606    32908 "   Film_Statistic Film_Statistic_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Film_Statistic"
    ADD CONSTRAINT "Film_Statistic_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."Film_Statistic" DROP CONSTRAINT "Film_Statistic_pkey";
       public            postgres    false    226            �           2606    24694    Film Films_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Film"
    ADD CONSTRAINT "Films_pk" PRIMARY KEY ("Id");
 ;   ALTER TABLE ONLY public."Film" DROP CONSTRAINT "Films_pk";
       public            postgres    false    215            �           2606    24717    Genre Genre_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public."Genre"
    ADD CONSTRAINT "Genre_pk" PRIMARY KEY ("Name");
 <   ALTER TABLE ONLY public."Genre" DROP CONSTRAINT "Genre_pk";
       public            postgres    false    218            �           2606    24710    News News_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public."News"
    ADD CONSTRAINT "News_pk" PRIMARY KEY ("Id");
 :   ALTER TABLE ONLY public."News" DROP CONSTRAINT "News_pk";
       public            postgres    false    217            �           2606    32877    Session Session_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."Session" DROP CONSTRAINT "Session_pkey";
       public            postgres    false    224            �           2606    32831    User User_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pk" PRIMARY KEY ("Id");
 :   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pk";
       public            postgres    false    222            �           2606    32888    User user_login_unique 
   CONSTRAINT     V   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_login_unique UNIQUE ("Login");
 B   ALTER TABLE ONLY public."User" DROP CONSTRAINT user_login_unique;
       public            postgres    false    222            �           2606    24738    Film_Genre Film_Genre_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY public."Film_Genre"
    ADD CONSTRAINT "Film_Genre_fk0" FOREIGN KEY ("Genre") REFERENCES public."Genre"("Name");
 G   ALTER TABLE ONLY public."Film_Genre" DROP CONSTRAINT "Film_Genre_fk0";
       public          postgres    false    218    220    3226            �           2606    24743    Film_Genre Film_Genre_fk1    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Film_Genre"
    ADD CONSTRAINT "Film_Genre_fk1" FOREIGN KEY ("Film") REFERENCES public."Film"("Id");
 G   ALTER TABLE ONLY public."Film_Genre" DROP CONSTRAINT "Film_Genre_fk1";
       public          postgres    false    3222    215    220            �           2606    49542    Session Session_Login_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_Login_fkey" FOREIGN KEY ("Login") REFERENCES public."User"("Login") ON DELETE CASCADE;
 H   ALTER TABLE ONLY public."Session" DROP CONSTRAINT "Session_Login_fkey";
       public          postgres    false    224    222    3232            �           2606    32909 !   Film_Statistic film_statistics_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Film_Statistic"
    ADD CONSTRAINT film_statistics_fk FOREIGN KEY ("FilmId") REFERENCES public."Film"("Id");
 M   ALTER TABLE ONLY public."Film_Statistic" DROP CONSTRAINT film_statistics_fk;
       public          postgres    false    226    215    3222            �           2606    32878    Session fk_session_filmid    FK CONSTRAINT     ~   ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT fk_session_filmid FOREIGN KEY ("FilmId") REFERENCES public."Film"("Id");
 E   ALTER TABLE ONLY public."Session" DROP CONSTRAINT fk_session_filmid;
       public          postgres    false    215    224    3222            J      x������ � �      L      x������ � �      =   �   x����j�@���S���IMߥ�4�_�C��R�wo�%b�W��:M�� ��݅e���~ |�Gl��Yb��9J�xJ(��ƺ~蚐H{��C��-�J�Ox&��*�w�_d��F���[:���q���ipv��5
�y^�78���7��){Ad]Ӻ %��5;a允�n��QGJ���8;�	K��߬b�VK��7�=�6�Z�iDW���)�~�~�u      B      x������ � �      H      x������ � �      @   /   x����¾�.l��t���. {+ׅE.츰�^l������ #�<      ?   �   x�U��J�@E�/_1t���$֭{W�ݔ,�R����k��B�ť��������7�h˛��9gXgP�[g(Qkn�c�
K4��O��bc�[K���Ժ���9�sb_�i��i���u~�|;�x<��oM�?�L��	^P�\3CyAE�>
�5����j�K��}�GW��H��p>��d�Jg2��[�6s0��7G������d5z'x����<M���i���p�zE�����p�:��y�)R�      F   T   x�=�1�0�N���m�����8��G51Noyp�U�QT3=ZH`�T�e���bLZ��^��$U�ɰp�gY��ژ����      D   )   x�3�LL�����32�,�21�,5�,,O-2�L����� ���     