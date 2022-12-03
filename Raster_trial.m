load ('data.mat')
figure('Units','normalized','Position',[0 0 .3 1])
ax = subplot(4,1,1); hold on

% For all trials...
for iTrial = 1:length(data)
    
    spks            = data(iTrial)';         % Get all spikes of respective trial
    xspikes         = repmat(spks,3,1);         % Replicate array
    yspikes      	= nan(size(xspikes));       % NaN array
    
    if ~isempty(yspikes)
        yspikes(1,:) = iTrial-1;                % Y-offset for raster plot
        yspikes(2,:) = iTrial;
    end
    
    plot(xspikes, yspikes, 'Color', 'k')
end

ax.XLim             = [0 7];
ax.YLim             = [0 length(rec)];
ax.XTick            = [0 1 2 3 4 5 6 7];

ax.XLabel.String  	= 'Time [s]';
ax.YLabel.String  	= 'Trials';
saveas(gcf,'Raster.fig')