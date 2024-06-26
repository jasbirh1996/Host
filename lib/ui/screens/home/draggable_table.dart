import 'dart:ui';

class DraggableTable{
  Offset offset;
  String shape;
  String tableName;
  String seatPerTable;
  String count;
  int rotation;
  String id;
  String qrCode;
  String tableStatus;

  DraggableTable(this.offset, this.shape,this.tableName, this.seatPerTable, this.count,this.rotation, this.id,this.qrCode,this.tableStatus);
}