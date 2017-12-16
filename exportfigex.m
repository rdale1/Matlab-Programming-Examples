 str=sprintf('%s_%d','filename',q); % print protein name on title
 title(str);
 xt='.jpg';
 str=strcat(str,xt);
 %str=sprintf('%d.jpg',m); % export image
 saveas(gcf,str);
 clf  