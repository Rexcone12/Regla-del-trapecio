% Definición de la función
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

a = 0;
b = 0.8;

I_exacto = 1.640533;

n = input('Ingrese el número de subintervalos n: ');

h = (b - a) / n;

x = linspace(a, b, n + 1);

y = f(x);

I = h * (0.5 * y(1) + sum(y(2:end-1)) + 0.5 * y(end));

error_absoluto = abs(I_exacto - I);
error_relativo = (error_absoluto / I_exacto) * 100;

f2 = @(x) -400 + 4050*x - 10800*x.^2 + 8000*x.^3;
x_fine = linspace(a, b, 1000);
f2_max = max(abs(f2(x_fine)));

error_estimado = ((b - a)^3 / (12 * n^2)) * f2_max;

fprintf('Integral aproximada: %.6f\n', I);
fprintf('Error absoluto: %.6f\n', error_absoluto);
fprintf('Error relativo porcentual: %.6f%%\n', error_relativo);
fprintf('Error estimado: %.6f\n', error_estimado);
