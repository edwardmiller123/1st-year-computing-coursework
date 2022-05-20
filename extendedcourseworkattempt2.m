
clear all;
figure('Position',[75,75,1000,700]);

Text_1 = uicontrol('Style','text');
set(Text_1,'String','Function');
set(Text_1,'Position',[700,310,200,20]);




function1= '$$ y=\frac{1}{(1+x)^2} = \sum_{n=1}^\infty n(-x)^{n-1}$$';
function2= '$$ y=sin(x)^2 = \sum_{n=1}^\infty (-1)^{n-1} \frac{(2^{2n-1})(x^{2n})}{(2n)!}$$';
function3= '$$ y=e^{-x^{2}} = \sum_{n=0}^\infty (-1)^{n}\frac{x^{2n}}{n!}$$';
annotation('textbox',[0.6, 0.5, 0.35, 0.4],'String',{['1)  ',function1],['2) ',function2],['3) ',function3]},'interpreter','latex');
 




%menu
func=uicontrol('Style','Popupmenu','String',{'1','2','3'},'Value',1,'Position',[775,280,50,25]);
nfunc=get(func,'Value');

%slider label
Text_2=uicontrol('Style','text');
set(Text_2,'String','number of terms')
set(Text_2,'Position',[700,240,200,20])

%nslider
ndisp=uicontrol('Style','Slider');
set(ndisp,'Min',1,'Max',20,'Value',1);
set(ndisp,'Position',[600,150,300,90]);
nmax=get(ndisp,'Value');

%n=
ndisp =uicontrol('Style','text');
set(ndisp,'String','n =');
set(ndisp,'Position',[900,220,50,25]);

%stop button
close= uicontrol('Style','togglebutton','String','Close','Position',[700,120,50,25]);


%function 1
if nfunc ==1
    
    x=[0:0.01:1];
    y=1./((1+x).^2);
    axes('Units','Pixels','Position',[60,60,500,500]);
    plot(x,y,'R-');
   hold on
    
   
    n=1;
    
    series1=0;
    while n <nmax
        
        term=n.*(-x).^(n-1);
        series1=series1+term;
        
        disp(['result for n= ',num2str(n), ' = ',num2str(series1)]);
        plot(x,series1,'b-');
        axes('Units','Pixels','Position',[60,60,500,500]);
        hold off
        n=n+1;
        
        
        
        
    end
    %function 2
elseif nfunc == 2
    x2=[0:0.1:6];
    y2=(sin(x2)).^2;
    axes('Units','Pixels','Position',[60,60,500,500]);
    plot(x2,y2,'R-');
    hold on
    n=0;
    
    series2=0;
    while n <nmax
        term2=((-1).^(n-1)).*(((2.^(n-1)).*x2.^(2.*n)./factorial(2.*n)));
        series2=series2+term2;
        
        disp(['result for n= ',num2str(n), ' = ',num2str(series2)]);
        plot(x2,series2,'b-');
        hold off
        n=n+1;
        
        
        
    end
    %function 3
elseif nfunc == 3
    x3=[0:0.05:3];
    y3=exp(-x3.^2);
   axes('Units','Pixels','Position',[60,60,500,500]);
    plot(x3,y3,'R-');
    hold on
    n=0;
    
    series3=0;
    while n <nmax
        term3=((-1).^n).*((x3.^(2.*n))/factorial(n));
        series3=series3+term3;
        
        disp(['result for n= ',num2str(n), ' = ',num2str(series3)]);
        plot(x3,series3,'b-');
        hold off
        
        n=n+1;
        
        
        
        
    end
end
