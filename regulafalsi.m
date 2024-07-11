eqn = input('Fonksiyonu giriniz: ', 's'); %string
f = str2func(['@(x)' eqn]);
x0 = input('xL değerini giriniz: ');
x1 = input('xU değerini giriniz: ');
epsilon = input('Minimum hata değerini giriniz: ');
max_iterations = input('Maksimum iterasyon sayısını giriniz: ');
err = abs(x1 - x0); %ilk hata
if sign(f(x0)) == sign(f(x1)) %işaretler farklı olmalı
disp('Aralık geçerli değil.');
return
end
% İterasyonları başlat
iteration_count = 0;
fprintf('\n x0 \t\t x1 \t\t x2 \t\t f(x0)\t\t f(x1) \t\t\t f(x2) \t\t\t
err');
while err > epsilon && iteration_count < max_iterations
x2 = x1 - ((x1 - x0) / (f(x1) - f(x0))) * f(x1);
root = x2;
fprintf('\n %0.7f \t %0.7f \t %0.7f \t %0.7f \t %0.7f \t %0.7f \t
%0.7f',x0,x1,x2,f(x0),f(x1),f(x2),err);
% scatter plot için hata değerlerini kaydet
err_values(iteration_count+1) = err;
%her yineleme adımında hesaplanan hata değerlerini err_values adlı bir
%vektörde saklasın
%her yineleme adımında, hesaplanan hata değeri (err) err_values vektörüne
eklenecek. bir vektördeki ilk öğe 1. indistir, ikinci öğe 2. indistir
if f(x1) * f(x2) < 0
x0 = x2; % x0 değerini güncelle
% f(x1)-> (+) f(x2)-> (-) f(x0)-> (-)
else
x1 = x2; %x1 değerini güncelle
% f(x1)-> (+) f(x2)-> (+) f(x0)-> (-)
end
err = abs(x1 - x0);
iteration_count = iteration_count + 1;
end
% Grafik çizimi
figure;
x = linspace(x0, x1, 1000);
y = f(x);
plot(x, y, 'b', 'LineWidth', 2);
hold on;
plot(root, f(root), 'ro', 'MarkerSize', 10);
xlabel('x');
ylabel('f(x)');
title('Denklem Grafiği ve Kök');
grid on;
% Scatter plot çizimi
figure;
iteration_numbers = 1:iteration_count; %1'den iterasyon sayacının değerine
kadar
scatter(iteration_numbers, err_values); %x ve ye koordiantları
xlabel('İterasyon Sayısı');
ylabel('Hata Değeri');
title('Her İterasyondaki Hata Değeri');
grid on;
