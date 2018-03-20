require 'illustruby/illustruby'
doc = Illustruby.new

origin, scale, yscale = [200,200], 140, 118
hashi = 0.15; saki = 1-hashi

png8 = WIN32OLE.new('Illustrator.ExportOptionsPNG8')

# right system
lyr = doc.ActiveLayer

xax_st, xax_ed = origin.plus([-scale*hashi,0]), origin.plus([+scale*saki,0])
yax_st, yax_ed = origin.plus([0,-yscale*hashi]), origin.plus([0,+yscale*saki])

xarrow = doc.arrow(xax_st,xax_ed,'1',lyr,'x-axis',[0,0])
yarrow = doc.arrow(yax_st,yax_ed,'1',lyr,'y-axis',[0,0])

xtext0 = doc.textart('�����W',
  xax_ed.plus([-6,+3]), 0, 1.2, lyr, 'x-axis', 'RB')
xtext1 = doc.textart('�E�ɍs���Ƒ�����',
  xax_ed.plus([-3,-3]), 0, 1, lyr, 'x-increase', 'RT')
ytext0 = doc.textart("��\r��\r�W",
  yax_ed.plus([+3,0]), 0, 1.2, lyr, 'y-axis', 'LT')
ytext1 = doc.textart("��\r��\r�s\r��\r��\r��\r��\r��",
  yax_ed.plus([-3,0]), 0, 1, lyr, 'y-increase', 'RT')

righttext = doc.textart("�E��n\rIllustrator",
  yax_ed.plus([scale*0.5,-scale*0.2]), 0, 1, lyr, '', 'CC')

print 'PRESS ENTER to saveas "rightsystem.png"'; gets
doc.saveas('rightsystem.png', png8)
lyr.PageItems.RemoveAll

# left system
lyr = doc.ActiveLayer

xax_st, xax_ed = origin.plus([-scale*hashi,0]), origin.plus([+scale*saki,0])
yax_st, yax_ed = origin.plus([0,+yscale*hashi]), origin.plus([0,-yscale*saki])

xarrow = doc.arrow(xax_st,xax_ed,'1',lyr,'x-axis',[0,0])
yarrow = doc.arrow(yax_st,yax_ed,'1',lyr,'y-axis',[0,0])

xtext0 = doc.textart('�����W',
  xax_ed.plus([-6,-3]), 0, 1.2, lyr, 'x-axis', 'RT')
xtext1 = doc.textart('�E�ɍs���Ƒ�����',
  xax_ed.plus([-3,+3]), 0, 1, lyr, 'x-increase', 'RB')
ytext0 = doc.textart("��\r��\r�W",
  yax_ed.plus([+3,+10]), 0, 1.2, lyr, 'y-axis', 'LB')
ytext1 = doc.textart("��\r��\r�s\r��\r��\r��\r��\r��",
  yax_ed.plus([-3,0]), 0, 1, lyr, 'y-increase', 'RB')

lefttext = doc.textart("����n\r�悭���邯�ǁA\r����������Ȃ�",
  yax_ed.plus([scale*0.6,+scale*0.2]), 0, 1, lyr, '', 'CC')
  
print 'PRESS ENTER to saveas "leftsystem.png"'; gets
doc.saveas('leftsystem.png', png8)
lyr.PageItems.RemoveAll

doc.Close(Illustruby::AiDoNotSaveChanges)
