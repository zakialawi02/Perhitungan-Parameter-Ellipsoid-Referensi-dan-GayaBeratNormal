clear all
clc
format long g
disp(' ')
disp('-------------------------------------------------------------------')
disp(' ')
disp('PROGRAM PERHITUNGAN PARAMETER ELLIPSOID REFERENSI DAN NILAI  GAYA BERAT NORMAL')
disp(' ')
disp('Mata Kuliah	: Geodesi Fisik')
disp('Kelas      	: B')
disp('Kelompok   	: C')
disp('Dosen Pengampu : Ira Mutiara Anjasmara, ST., M.Phil., PhD')
disp('Program perhitungan parameter-parameter pada sebuah elipsoida referensi ')
disp(' ')
disp('----- --------------------------------------------------------------')
disp(' ')
 
disp ('Ellipsoid Referensi yang digunakan : ')
disp ('1) International Ellipsoid 1924')
disp ('2) Geodetic Reference System 1980 (GRS 80)')
disp ('3) World Geodetic System 1984 (WGS 84)')
disp (' ')
Referensi = input ('Pilih Ellipsoid Referensi yang akan digunakan (1/2/3): ');
disp (' ')

%% konstanta dasar ellipsoid
	if Referensi == 1;
    	disp ('International Ellipsoid 1924')
    	disp (' ')
    	a   = 6378388;
    	b   = 6356775;
    	G_a  = 9.780490;
    	G_b  = 9.832177;
    	W  = ((7292115)*10^-11);
    	GM = ((398603)*10^9);	
	elseif Referensi == 2;
    	disp ('GRS80')
    	disp (' ')
    	a   = 6378137;
    	b   = 6356752.3141;
    	G_a  = 9.7803267715;
    	G_b  = 9.8321863685; 
    	W  = ((7292115)*10^-11);
    	GM = ((3986005)*10^8);
	else
   	disp ('WGS84')
    	disp (' ')
    	a   = 6378137;
    	b   = 6356752.3142;
    	G_a  = 9.7803253359;
    	G_b  = 9.8321849378;
    	W  = ((7292115)*10^-11);
    	GM = ((3986004.418)*10^8);
	end
	
%% nilai lintang
lintang = input('Input nilai lintang [D M S] : ');
Lintang = dms2degrees(lintang);
 
disp(' ')
disp('------------------PARAMETER ELLIPSOID---------------')
disp(' ')
 
%% parameter ellipsoid
disp ('Berikut adalah nilai parameter-parameter ellipsoidnya: ')
%Nilai Flattening
f = ((a-b)/a);
disp (['flattening (f)= ' num2str(f)])
e = ((a)^2-(b)^2)/(a)^2;
%eksentrisitas (e)
disp (['eksentrisitas (e) = ' num2str(e)])
%jari-jari lengkung meridian
M = (a*(1-e))/sqrt((1-e*(sind(Lintang))^2)^3);
disp(['jari-jari meridian (M) = ' num2str(M)])
%jari-jari lengkung utama(v)
v = a/(sqrt(1-e*(sind(Lintang))^2));
disp(['jari-jari lengkung utama (v) = ' num2str(v)])
%jari-jari rata-rata Gauss (R)
R = sqrt(M*v);
disp(['jari-jari rata-rata Gauss (R) = ' num2str(R)])
disp (' ')
 
disp(' ')
disp('----------------GAYA BERAT NORMAL-----------------------')
disp(' ')
 
%% Gaya berat normal
disp ('Menghitung nilai gaya berat normal pada suatu lintang');
lintangg=input('Pilih 0 untuk tidak, pilih 1 untuk menghitung(0/1):');
switch lintangg
        case 1
        G = ((a*G_a*cosd(Lintang)*cosd(Lintang))+(b*G_b*sind(Lintang)*sind(Lintang)))/(sqrt((a*a*cosd(Lintang)*cosd(Lintang))+(b*b*sind(Lintang)*sind(Lintang))));
        disp(' ')
        disp (['Nilai gaya berat normal pada lintang [' num2str(lintang) '] adalah ' num2str(G*100000) ' mGal'])
case 0
        disp ('===Selesai===')
     	end

        disp(' ')
disp('----------GAYA BERAT NORMAL PADA KETINGGIAN TERTENTU--------')
 
%Gamma(h)
	disp (' ')
	disp ('Menghitung nilai gaya berat normal pada lintang dan ketinggian tertentu');
	tinggi=input('Pilih 0 untuk tidak, pilih 1 untuk menghitung(0/1):');
     	switch tinggi
        	case 1
            	h = input('Input nilai ketinggian (m) = ');
            	m = (W^2*a^2*b)/GM;  %parameter geodetik
            	g_h= G*(1-2*(1+f+m-2*f*sind(Lintang)*sind(Lintang))*(h/a)+3*(h^2/a^2));
    	        disp(' ')
                disp (['Nilai Gaya Berat Normal pada ketinggian ' num2str(h) ' meter adalah ' num2str(g_h*100000) ' mGal'])
                disp (' ')
                disp ('===Selesai===')
        	case 0
            	disp (' ')
                disp ('===Selesai===')
     	end
     	
disp(' ')
disp('------------------------------------------------------------')
disp(' ')