function [] = plotIonoMap(fullFileName, world_map, tec_map, plotTitle, minC, maxC)

        map = figure('visible','on');
        lon = tec_map(:,2);
        lat = tec_map(:,1);
        scatter(lon, lat, 50, tec_map(:,3), 's', 'filled');
        hold on;
        %drawing coastlines
        plot(world_map(:,1),world_map(:,2),'k');
        %country borders
        %https://www.mathworks.com/matlabcentral/fileexchange/50390-borders
        %borders('countries','k')
        colormap(jet);
        title(colorbar,'TEC [TECU]')
        ylabel('Latitude [deg]')
        xlabel('Longitude [deg]')
        axis([-60 60 10 90]);
        caxis([minC maxC]);
      
        title (sprintf(plotTitle));
        print(map, fullFileName,'-dpng');
        savefig(map, fullFileName);
        
        close(map);
end