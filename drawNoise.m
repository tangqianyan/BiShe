function drawNoise(E_hat)

E_hat = fliplr(E_hat);
E_hat = flipud(E_hat)

%-------------Draw Fingure-------------
CH=size(E_hat,1);
ROW=size(E_hat,2);
% ≤‚¡ø«¯”Ú
CHH=linspace(CH,1,CH);
RWW=linspace(ROW,1,ROW);
[RWW,CHH]=meshgrid(RWW,CHH);

figure;
set(gca,'nextplot','replacechildren');
set(gca,'XGrid','off');

    pcolor(RWW,CHH,E_hat);
    axis tight;
    axis equal;
    shading flat;
    shading interp;
    colorbar;
    set(gca,'CLim',[-1,1]);
    h_axes=findobj(gcf,'type','axes');
    set(h_axes,'LineWidth',1.5);
    set(h_axes,'fontsize',14)
    set(h_axes,'fontweight','bold')
    set(h_axes,'XMinorTick','on')
    set(h_axes,'YMinorTick','on')
    set(h_axes,'layer','top')
    axis on;
   
hold on

 