PGDMP     %    ;                {            Cinema    15.1    15.1 $    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    32950    Cinema    DATABASE     |   CREATE DATABASE "Cinema" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Cinema";
                postgres    false            �            1259    33371    AvailableSeat2D    TABLE     �   CREATE TABLE public."AvailableSeat2D" (
    "FilmId" integer NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "row" integer NOT NULL,
    "column" integer NOT NULL,
    taken boolean NOT NULL
);
 %   DROP TABLE public."AvailableSeat2D";
       public         heap    postgres    false            �            1259    33361    AvailableSeat3D    TABLE     �   CREATE TABLE public."AvailableSeat3D" (
    "FilmId" integer NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "row" integer NOT NULL,
    "column" integer NOT NULL,
    taken boolean NOT NULL
);
 %   DROP TABLE public."AvailableSeat3D";
       public         heap    postgres    false            �            1259    33188    DatePrice2D    TABLE     �   CREATE TABLE public."DatePrice2D" (
    "Id" integer NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Price" numeric NOT NULL,
    "FilmId" integer NOT NULL
);
 !   DROP TABLE public."DatePrice2D";
       public         heap    postgres    false            �            1259    33187    DatePrice2D_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."DatePrice2D_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."DatePrice2D_Id_seq";
       public          postgres    false    219            &           0    0    DatePrice2D_Id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."DatePrice2D_Id_seq" OWNED BY public."DatePrice2D"."Id";
          public          postgres    false    218            �            1259    33172    DatePrice3D    TABLE     �   CREATE TABLE public."DatePrice3D" (
    "Id" integer NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Price" numeric NOT NULL,
    "FilmId" integer
);
 !   DROP TABLE public."DatePrice3D";
       public         heap    postgres    false            �            1259    33171    DatePrice3D_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."DatePrice3D_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."DatePrice3D_Id_seq";
       public          postgres    false    217            '           0    0    DatePrice3D_Id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."DatePrice3D_Id_seq" OWNED BY public."DatePrice3D"."Id";
          public          postgres    false    216            �            1259    33139    Film    TABLE     �   CREATE TABLE public."Film" (
    "Id" integer NOT NULL,
    "Title" character varying NOT NULL,
    "Description" character varying NOT NULL,
    "Image" character varying NOT NULL
);
    DROP TABLE public."Film";
       public         heap    postgres    false            �            1259    33138    Film_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."Film_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Film_Id_seq";
       public          postgres    false    215            (           0    0    Film_Id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Film_Id_seq" OWNED BY public."Film"."Id";
          public          postgres    false    214            y           2604    33191    DatePrice2D Id    DEFAULT     v   ALTER TABLE ONLY public."DatePrice2D" ALTER COLUMN "Id" SET DEFAULT nextval('public."DatePrice2D_Id_seq"'::regclass);
 A   ALTER TABLE public."DatePrice2D" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    218    219    219            x           2604    33175    DatePrice3D Id    DEFAULT     v   ALTER TABLE ONLY public."DatePrice3D" ALTER COLUMN "Id" SET DEFAULT nextval('public."DatePrice3D_Id_seq"'::regclass);
 A   ALTER TABLE public."DatePrice3D" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    216    217    217            w           2604    33142    Film Id    DEFAULT     h   ALTER TABLE ONLY public."Film" ALTER COLUMN "Id" SET DEFAULT nextval('public."Film_Id_seq"'::regclass);
 :   ALTER TABLE public."Film" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    215    214    215                      0    33371    AvailableSeat2D 
   TABLE DATA           U   COPY public."AvailableSeat2D" ("FilmId", "Date", "row", "column", taken) FROM stdin;
    public          postgres    false    221   A*                 0    33361    AvailableSeat3D 
   TABLE DATA           U   COPY public."AvailableSeat3D" ("FilmId", "Date", "row", "column", taken) FROM stdin;
    public          postgres    false    220   =+                 0    33188    DatePrice2D 
   TABLE DATA           H   COPY public."DatePrice2D" ("Id", "Date", "Price", "FilmId") FROM stdin;
    public          postgres    false    219   �+                 0    33172    DatePrice3D 
   TABLE DATA           H   COPY public."DatePrice3D" ("Id", "Date", "Price", "FilmId") FROM stdin;
    public          postgres    false    217   ,                 0    33139    Film 
   TABLE DATA           G   COPY public."Film" ("Id", "Title", "Description", "Image") FROM stdin;
    public          postgres    false    215   �,       )           0    0    DatePrice2D_Id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."DatePrice2D_Id_seq"', 77, true);
          public          postgres    false    218            *           0    0    DatePrice3D_Id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."DatePrice3D_Id_seq"', 61, true);
          public          postgres    false    216            +           0    0    Film_Id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Film_Id_seq"', 45, true);
          public          postgres    false    214            �           2606    33365 $   AvailableSeat3D AvailableSeat3d_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AvailableSeat3D"
    ADD CONSTRAINT "AvailableSeat3d_pkey" PRIMARY KEY ("FilmId", "Date", "row", "column");
 R   ALTER TABLE ONLY public."AvailableSeat3D" DROP CONSTRAINT "AvailableSeat3d_pkey";
       public            postgres    false    220    220    220    220            �           2606    33375 "   AvailableSeat2D AvailableSeat_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."AvailableSeat2D"
    ADD CONSTRAINT "AvailableSeat_pkey" PRIMARY KEY ("FilmId", "Date", "row", "column");
 P   ALTER TABLE ONLY public."AvailableSeat2D" DROP CONSTRAINT "AvailableSeat_pkey";
       public            postgres    false    221    221    221    221            �           2606    33195    DatePrice2D DatePrice2D_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."DatePrice2D"
    ADD CONSTRAINT "DatePrice2D_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."DatePrice2D" DROP CONSTRAINT "DatePrice2D_pkey";
       public            postgres    false    219                       2606    33179    DatePrice3D DatePrice3D_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."DatePrice3D"
    ADD CONSTRAINT "DatePrice3D_pkey" PRIMARY KEY ("Id");
 J   ALTER TABLE ONLY public."DatePrice3D" DROP CONSTRAINT "DatePrice3D_pkey";
       public            postgres    false    217            {           2606    33146    Film Film_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Film"
    ADD CONSTRAINT "Film_pkey" PRIMARY KEY ("Id");
 <   ALTER TABLE ONLY public."Film" DROP CONSTRAINT "Film_pkey";
       public            postgres    false    215            }           2606    33148    Film Film_title_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Film"
    ADD CONSTRAINT "Film_title_key" UNIQUE ("Title");
 A   ALTER TABLE ONLY public."Film" DROP CONSTRAINT "Film_title_key";
       public            postgres    false    215            �           2606    49537 *   AvailableSeat3D availableSeats3d_filmId_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."AvailableSeat3D"
    ADD CONSTRAINT "availableSeats3d_filmId_fk" FOREIGN KEY ("FilmId") REFERENCES public."Film"("Id") ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."AvailableSeat3D" DROP CONSTRAINT "availableSeats3d_filmId_fk";
       public          postgres    false    215    220    3195            �           2606    49532 (   AvailableSeat2D availableSeats_filmId_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."AvailableSeat2D"
    ADD CONSTRAINT "availableSeats_filmId_fk" FOREIGN KEY ("FilmId") REFERENCES public."Film"("Id") ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."AvailableSeat2D" DROP CONSTRAINT "availableSeats_filmId_fk";
       public          postgres    false    215    221    3195            �           2606    49522 !   DatePrice2D fk_dateprice2d_filmid    FK CONSTRAINT     �   ALTER TABLE ONLY public."DatePrice2D"
    ADD CONSTRAINT fk_dateprice2d_filmid FOREIGN KEY ("FilmId") REFERENCES public."Film"("Id") ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."DatePrice2D" DROP CONSTRAINT fk_dateprice2d_filmid;
       public          postgres    false    219    215    3195            �           2606    49527 !   DatePrice3D fk_dateprice3d_filmid    FK CONSTRAINT     �   ALTER TABLE ONLY public."DatePrice3D"
    ADD CONSTRAINT fk_dateprice3d_filmid FOREIGN KEY ("FilmId") REFERENCES public."Film"("Id") ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."DatePrice3D" DROP CONSTRAINT fk_dateprice3d_filmid;
       public          postgres    false    217    3195    215               �   x����� Dϸ�4���HjI���O���f��¤����ɭ���)R�Dyo��A��#���� G[�9��/��.�V� ӳJN}���1}\P('��m
u����C�����m�[��al4J#�8�_�N�uJaP~Je���A��:)��u*\F	.�J�C#�F��<;)������c�Δ�(v��Q'�17g��\�?����ڹv-d�apDp�+����2~��}۶S�F�         ;   x�36�4202�50�56P04�26�2 �q�s�pc�4�4�-i�i�[҂�(���� ��         s   x�U��1���,P�:u�:��?-D��'ۊ�A�Zq<*�c ��abR�PO���BU�Ռ�֥դ���N}m�{��J�;i�f�gR޵#iM����,�"�;����if߹4�         q   x�U���0Dѳ��ȳ,�Ī%��y������g#h���:0n�bߢ�j�W�H�G���]}����Z4:�r��]r(ŭ�,3���<5����ݥ�*s(�|�_�;D���4�         �   x�]�=n�@���)&@'w�A."�(�Mg�#a���"QR!Њ��ơ�\�jgw���l�t�N��=.ȭxp���OS��(���+u�k�-y��F���-�5��Ё�j:�G!�_��R��	�5C/8�v�L?u(�R_�R�Ҕ�=�vL̤��r���Y��+�w|.6��oPU�y͵�����(��4#�&�[|��#2<'���	��X�i�{*Y�FE7��ϴ     