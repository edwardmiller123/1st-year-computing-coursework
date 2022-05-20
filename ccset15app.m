function ccset15app

figure('Position',[200,200,800,600]);
axes('Units','pixels','Position',[50,50,400,300]);


stopbutton=uicontrol('Style','togglebutton','String','Close',...
    'Position',[500,120,50,25],'Callback',@togglebutton_Callback);

Opennewfile=uicontrol('Style','Pushbutton','String','Open new file',...
    'Position',[500,90,100,25],'Callback',@readdata_Callback);

    function togglebutton_Callback(source,eventdata)
        close all;
    end

    function readdata_Callback(source,eventdata)
        data=uigetfile('*.txt');
        a=dlmread(data);
        x=a(:,1);
        y=a(:,2);
        [m,c]=lsqfit(x,y);
        plot(x,y,'b*');
        y1=m.*x+c;
        hold on
        plot(x,y1,'R-');
        title(['Line of best fit with gradient ',num2str(m),' and intercept ',num2str(c)]);
        
    end


end