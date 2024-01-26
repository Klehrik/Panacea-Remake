{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_Game",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_26CEE6C9","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_70EE7782","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_6623ACAC","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_1A6C6A3E","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_2108B250","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_279660CF","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_4CC24844","path":"rooms/rm_Game/rm_Game.yy",},
    {"name":"inst_3969C7E3","path":"rooms/rm_Game/rm_Game.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Game_Instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_279660CF","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Manager","path":"objects/obj_Manager/obj_Manager.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4CC24844","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ParticleManager","path":"objects/obj_ParticleManager/obj_ParticleManager.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":16.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3969C7E3","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_ParticleManagerLower","path":"objects/obj_ParticleManagerLower/obj_ParticleManagerLower.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Grass","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":72,"SerialiseWidth":256,"TileCompressedData":[
-18432,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_Tileset","path":"tilesets/ts_Tileset/ts_Tileset.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2108B250","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Player","path":"objects/obj_Player/obj_Player.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":792.0,"y":51.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Camera_Borders","depth":300,"effectEnabled":true,"effectType":null,"gridX":256,"gridY":144,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_26CEE6C9","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_CameraBorder","path":"objects/obj_CameraBorder/obj_CameraBorder.yy",},"properties":[],"rotation":0.0,"scaleX":3.999998,"scaleY":2.25,"x":768.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_70EE7782","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_CameraBorder","path":"objects/obj_CameraBorder/obj_CameraBorder.yy",},"properties":[],"rotation":0.0,"scaleX":8.0,"scaleY":2.25,"x":1024.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6623ACAC","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_CameraBorder","path":"objects/obj_CameraBorder/obj_CameraBorder.yy",},"properties":[],"rotation":0.0,"scaleX":8.0,"scaleY":2.25,"x":1536.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Geometry","depth":400,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":72,"SerialiseWidth":256,"TileCompressedData":[
-89,0,-34,-2147483648,-37,0,-60,-2147483648,1,1,-35,-2147483648,-89,0,-34,-2147483648,-37,0,-60,-2147483648,1,1,-35,-2147483648,-89,0,-34,-2147483648,-37,0,-60,-2147483648,1,1,-35,-2147483648,-89,0,-34,-2147483648,-37,0,-59,-2147483648,1,1,-16,-2147483648,-10,1,-10,-2147483648,-89,0,-34,-2147483648,-17,0,-7,-2147483648,-13,0,-59,-2147483648,1,1,-9,-2147483648,-7,1,-10,-2147483648,-3,1,-7,-2147483648,-89,0,-34,-2147483648,-13,0,-17,-2147483648,-7,0,-59,-2147483648,1,1,-7,-2147483648,-2,1,-20,-2147483648,1,1,-6,-2147483648,-89,0,-34,-2147483648,-10,0,-21,-2147483648,-6,0,-59,-2147483648,1,1,-6,-2147483648,1,1,-23,-2147483648,1,1,-5,-2147483648,-89,0,-7,-2147483648,-5,1,1,0,-21,-2147483648,-7,0,3,-2147483648,0,0,-21,-2147483648,-6,0,-59,-2147483648,1,1,-5,-2147483648,1,1,-24,-2147483648,-6,1,-89,0,-8,-2147483648,-4,0,-4,1,-2,0,-17,-2147483648,-8,0,-22,-2147483648,-6,0,-36,-2147483648,-6,1,-18,-2147483648,1,1,-4,-2147483648,1,1,-30,-2147483648,-89,0,-2,-2147483648,-14,0,1,1,-18,-2147483648,-8,0,-58,-2147483648,-6,1,-4,-2147483648,1,1,-19,-2147483648,1,1,-4,-2147483648,1,1,-30,-2147483648,-105,0,1,1,-19,-2147483648,-5,0,-55,-2147483648,-5,1,-9,-2147483648,1,1,-21,-2147483648,-4,1,-31,-2147483648,-104,0,2,-2147483648,1,-20,-2147483648,-2,0,-15,-2147483648,-9,1,-29,-2147483648,-4,
1,-13,-2147483648,1,1,-57,-2147483648,-104,0,2,-2147483648,1,-20,-2147483648,-2,0,-15,-2147483648,1,1,-6,-2147483648,-2,0,-5,1,-3,0,-16,-2147483648,-5,1,-17,-2147483648,1,1,-47,-2147483648,-10,1,-104,0,2,-2147483648,1,-20,-2147483648,-2,0,-14,-2147483648,2,0,1,-5,0,1,-2147483648,-6,0,1,1,-3,0,-10,-2147483648,-6,1,-22,-2147483648,1,1,-41,-2147483648,-4,1,-2,-2147483648,1,1,-9,-2147483648,-103,0,-3,-2147483648,1,1,-14,-2147483648,-15,0,1,-2147483648,-6,1,-6,0,1,-2147483648,-6,0,1,1,-3,0,-10,-2147483648,1,1,-26,-2147483648,1,1,-19,-2147483648,-15,1,-4,-2147483648,-4,1,-3,-2147483648,4,1,-2147483648,-2147483648,1,-9,-2147483648,-107,0,-6,1,-4,0,-2,-2147483648,-4,0,-14,1,-2,-2147483648,-18,0,3,1,0,0,-10,-2147483648,1,1,-26,-2147483648,1,1,-19,-2147483648,1,1,-13,-2147483648,1,1,-4,-2147483648,1,1,-6,-2147483648,4,1,2,2,1,-9,-2147483648,-105,0,-3,-2147483648,-5,0,-10,1,-13,0,-3,-2147483648,-19,0,-4,1,-8,-2147483648,1,1,-27,-2147483648,-2,1,-6,-2147483648,-5,1,-4,-2147483648,-2,1,-14,-2147483648,1,1,-4,-2147483648,1,1,-7,-2147483648,-2,1,-10,-2147483648,-160,0,-2,-2147483648,-8,1,-30,-2147483648,-6,1,-5,-2147483648,-4,1,-16,-2147483648,1,1,-4,2,1,1,-49,-2147483648,1,0,-52,-2147483648,1,0,
-13740,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_Geometry","path":"tilesets/ts_Geometry/ts_Geometry.yy",},"userdefinedDepth":false,"visible":false,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Front_Tiles","depth":500,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":72,"SerialiseWidth":256,"TileCompressedData":[
-124,-2147483648,-37,0,-59,-2147483648,1,17,-35,18,-124,-2147483648,-37,0,-59,-2147483648,1,17,-35,18,-124,-2147483648,-37,0,-59,-2147483648,1,17,-35,18,-123,-2147483648,-38,0,-58,-2147483648,1,1,-16,18,-10,34,-10,18,-123,-2147483648,-17,0,-10,-2147483648,-11,0,-58,-2147483648,1,17,-9,18,-6,34,1,35,-10,-2147483648,3,33,34,34,-7,18,-123,-2147483648,-10,0,-20,-2147483648,-8,0,-58,-2147483648,1,17,-7,18,2,34,35,-20,-2147483648,1,33,-6,18,-123,-2147483648,-8,0,-23,-2147483648,-7,0,-58,-2147483648,1,17,-6,18,1,35,-23,-2147483648,1,17,-5,18,1,0,-94,-2147483648,1,1,-4,2,2,3,0,-21,-2147483648,-7,0,-24,-2147483648,-7,0,-58,-2147483648,1,33,-5,18,1,19,-24,-2147483648,1,33,-5,34,-4,0,-91,-2147483648,1,17,-5,18,-3,2,2,3,0,-18,-2147483648,-6,0,-66,-2147483648,1,1,-4,2,1,22,-18,-2147483648,1,17,-4,18,1,19,-30,-2147483648,-5,0,-89,-2147483648,2,0,17,-9,18,1,3,-18,-2147483648,-6,0,-60,-2147483648,1,1,-5,2,-4,18,1,35,-19,-2147483648,1,33,-4,18,1,35,-30,-2147483648,-5,0,-84,-2147483648,-6,0,1,17,-9,18,1,19,-19,-2147483648,-4,0,-56,-2147483648,1,1,-4,2,-9,18,1,35,-21,-2147483648,4,33,34,34,35,-31,-2147483648,-5,0,-42,
-2147483648,-9,0,-29,-2147483648,-10,0,1,17,-9,18,1,19,-37,-2147483648,1,1,-7,2,1,3,-29,-2147483648,1,1,-3,2,-13,18,1,19,-57,-2147483648,-5,0,-42,-2147483648,-14,0,-19,-2147483648,-15,0,1,17,-9,18,1,19,-37,-2147483648,1,17,-8,18,-4,2,1,3,-4,0,-15,-2147483648,1,1,-4,2,-17,18,1,19,-47,-2147483648,1,1,-9,2,-5,0,-42,-2147483648,-14,0,-13,-2147483648,-21,0,1,17,-9,18,1,19,-37,-2147483648,1,17,-12,18,1,19,-4,0,-9,-2147483648,1,1,-5,2,-22,18,1,35,-41,-2147483648,7,1,2,2,3,-2147483648,-2147483648,17,-9,18,-6,0,-35,-2147483648,-20,0,-13,-2147483648,-21,0,1,17,-10,18,1,3,-14,-2147483648,-15,0,2,-2147483648,1,-5,2,-13,18,1,19,-4,0,-9,-2147483648,1,17,-26,18,1,19,-19,-2147483648,1,1,-13,2,1,3,-4,-2147483648,1,1,-3,2,-3,18,4,19,-2147483648,-2147483648,17,-9,18,-12,0,-13,-2147483648,-37,0,-12,-2147483648,-21,0,1,17,-11,18,-5,2,2,3,0,-7,-2147483648,-2,0,1,1,-13,2,-20,18,1,3,-3,0,-9,-2147483648,1,17,-26,18,1,19,-19,-2147483648,1,17,-13,18,1,19,-4,-2147483648,1,17,-6,18,4,19,82,82,17,-9,18,-66,0,-8,-2147483648,-21,0,1,
17,-17,18,-10,2,-35,18,-3,2,1,3,-8,-2147483648,1,17,-27,18,2,2,3,-6,-2147483648,1,1,-3,2,1,3,-4,-2147483648,2,1,2,-14,18,1,19,-4,-2147483648,1,17,-7,18,-2,2,-10,18,-95,0,1,17,-66,18,-8,2,-30,18,-6,2,-5,18,-4,2,-16,18,1,19,-4,82,1,17,-19,18,-95,0,1,17,-136,18,-4,2,-20,18,-95,0,1,33,-160,34,-13312,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_Tileset","path":"tilesets/ts_Tileset/ts_Tileset.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Water","depth":600,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1A6C6A3E","colour":4294967295,"frozen":true,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Water","path":"objects/obj_Water/obj_Water.yy",},"properties":[],"rotation":0.0,"scaleX":5.25,"scaleY":1.0,"x":1576.0,"y":116.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Back_Tiles","depth":700,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":72,"SerialiseWidth":256,"TileCompressedData":[
-119,-2147483648,-7,0,-91,-2147483648,1,40,-3,25,1,42,-154,-2147483648,-5,0,-93,-2147483648,3,24,25,26,-156,-2147483648,-4,0,-93,-2147483648,3,24,25,26,-157,-2147483648,-3,0,-10,-2147483648,1,0,-3,-2147483648,-7,0,-5,-2147483648,-2,0,-65,-2147483648,3,40,41,42,-14,-2147483648,1,8,-5,9,1,10,-5,-2147483648,2,8,10,-129,-2147483648,-3,0,-7,-2147483648,-4,0,-3,-2147483648,-7,0,-5,-2147483648,-3,0,-74,-2147483648,4,8,10,-2147483648,59,-3,-2147483648,1,40,-5,25,1,42,-5,-2147483648,3,24,25,10,-136,-2147483648,-6,0,-4,-2147483648,-5,0,-6,-2147483648,-4,0,-71,-2147483648,4,8,9,25,26,-6,-2147483648,1,24,-3,25,1,26,-6,-2147483648,4,40,25,25,10,-129,-2147483648,1,0,-4,-2147483648,-6,0,-5,-2147483648,-5,0,-7,-2147483648,-3,0,-2,-2147483648,1,0,-67,-2147483648,1,8,-3,25,1,26,-6,-2147483648,1,40,-3,25,1,26,-7,-2147483648,6,40,41,26,-2147483648,-2147483648,12,-126,-2147483648,1,0,-4,-2147483648,-5,0,-7,-2147483648,-5,0,-7,-2147483648,-6,0,-66,-2147483648,5,24,25,25,41,42,-7,-2147483648,1,40,-3,25,1,10,-8,-2147483648,5,40,9,9,25,10,-102,-2147483648,5,0,-2147483648,-2147483648,0,0,-18,-2147483648,1,0,-4,-2147483648,-3,0,-9,-2147483648,-5,0,-8,-2147483648,-5,0,-41,-2147483648,2,8,10,-23,-2147483648,3,24,
41,42,-10,-2147483648,4,24,25,25,26,-9,-2147483648,4,24,25,25,42,-5,-2147483648,-5,0,-91,-2147483648,-5,0,3,8,10,0,-16,-2147483648,-2,0,-2,-2147483648,-2,0,-12,-2147483648,-4,0,-7,-2147483648,-5,0,-40,-2147483648,4,8,9,25,26,-18,-2147483648,6,8,10,-2147483648,-2147483648,8,26,-12,-2147483648,4,24,25,25,26,-8,-2147483648,4,8,25,25,26,-6,-2147483648,-8,0,-88,-2147483648,-5,0,3,24,25,10,-15,-2147483648,-7,0,-12,-2147483648,-4,0,-5,-2147483648,-8,0,-39,-2147483648,4,24,25,25,42,-18,-2147483648,6,40,25,9,9,25,26,-12,-2147483648,4,24,25,25,26,-8,-2147483648,1,24,-3,25,1,10,-5,-2147483648,-7,0,1,-2147483648,-3,0,-28,-2147483648,-5,0,-52,-2147483648,-5,0,3,24,25,26,-14,-2147483648,-9,0,-10,-2147483648,3,0,8,10,-3,0,-3,-2147483648,-10,0,-38,-2147483648,3,24,25,26,-20,-2147483648,1,24,-4,25,1,10,-10,-2147483648,1,8,-4,25,1,10,-6,-2147483648,1,8,-5,25,1,10,-4,-2147483648,-7,0,-32,-2147483648,-5,0,-52,-2147483648,-5,0,3,24,25,26,-14,-2147483648,-9,0,-9,-2147483648,4,8,9,25,26,-4,0,-2,-2147483648,-10,0,-38,-2147483648,3,24,25,26,-19,-2147483648,1,8,-5,25,1,26,-10,-2147483648,1,24,-5,25,6,10,-2147483648,-2147483648,12,-2147483648,27,-4,
41,-2,25,1,42,-4,-2147483648,-7,0,-2,-2147483648,1,0,-22,-2147483648,-3,0,-2,-2147483648,-7,0,-25,-2147483648,-2,0,-25,-2147483648,-5,0,4,24,25,25,10,-13,-2147483648,-10,0,-7,-2147483648,1,8,-3,25,1,26,-4,0,3,-2147483648,0,0,-6,-2147483648,-2,0,-10,-2147483648,2,8,10,-26,-2147483648,4,8,25,25,26,-17,-2147483648,2,8,9,-7,25,1,10,-8,-2147483648,1,8,-4,25,-2,41,4,26,-2147483648,8,26,-6,-2147483648,2,40,42,-5,-2147483648,-11,0,-20,-2147483648,-13,0,-12,-2147483648,-3,0,-7,-2147483648,-5,0,-25,-2147483648,-5,0,1,40,-3,25,4,9,10,-2147483648,-2147483648,-3,0,-5,-2147483648,-11,0,-5,-2147483648,-2,0,-4,41,4,42,0,-2147483648,-2147483648,-4,0,-5,-2147483648,3,8,9,10,-8,-2147483648,4,8,9,25,26,-26,-2147483648,1,24,-3,25,1,10,-7,-2147483648,3,8,9,10,-6,-2147483648,2,40,25,-7,41,1,42,-8,-2147483648,1,40,-3,41,7,42,-2147483648,-2147483648,24,9,25,26,-14,-2147483648,-10,0,-21,-2147483648,-6,0,-18,-2147483648,-5,0,-4,-2147483648,-6,0,-26,-2147483648,-5,0,1,40,-3,41,1,42,-5,0,4,-2147483648,0,-2147483648,-2147483648,-4,0,-8,-2147483648,-6,0,-9,-2147483648,-4,0,-5,-2147483648,5,40,25,25,9,10,-5,-2147483648,1,8,-3,25,1,26,-26,-2147483648,1,24,
-4,25,2,9,10,-3,-2147483648,5,8,9,25,25,26,-7,-2147483648,1,57,-11,-2147483648,3,8,9,10,-9,-2147483648,4,24,25,25,26,-20,-2147483648,-11,0,3,-2147483648,0,0,-36,-2147483648,-14,0,-26,-2147483648,-17,0,1,-2147483648,-6,0,-10,-2147483648,-6,0,-6,-2147483648,-4,0,-6,-2147483648,1,40,-3,41,5,10,-2147483648,-2147483648,8,9,-4,25,1,26,-26,-2147483648,2,24,41,-5,25,-3,9,6,41,25,41,41,25,10,-6,-2147483648,2,40,29,-10,-2147483648,6,24,25,25,9,9,10,-6,-2147483648,4,40,41,41,42,-30,-2147483648,-3,0,-41,-2147483648,-10,0,-26,-2147483648,2,0,-2147483648,-8,0,4,-2147483648,0,-2147483648,-2147483648,-3,0,-17,-2147483648,-6,0,-20,-2147483648,6,44,-2147483648,-2147483648,24,25,25,-3,41,1,42,-26,-2147483648,3,44,-2147483648,40,-6,41,7,42,-2147483648,44,-2147483648,-2147483648,40,42,-18,-2147483648,1,40,-4,25,1,26,-87,-2147483648,-3,0,-65,-2147483648,-5,0,-23,-2147483648,3,40,41,42,-65,-2147483648,1,40,-3,41,1,42,-13587,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_Tileset","path":"tilesets/ts_Tileset/ts_Tileset.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Level_Layout_Background","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":800,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"spr_LevelLayoutBackground","path":"sprites/spr_LevelLayoutBackground/spr_LevelLayoutBackground.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Backgrounds","depth":900,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":4,"SerialiseWidth":8,"TileCompressedData":[
-4,-2147483648,4,0,-2147483648,-2147483648,1,-24,
-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_Backgrounds","path":"tilesets/ts_Backgrounds/ts_Backgrounds.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Draw_Background","animationFPS":15.0,"animationSpeedType":0,"colour":4279830284,"depth":5000,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":true,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":true,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Panacea Remake",
    "path": "Panacea Remake.yyp",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 576,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 2048,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":720,"hspeed":-1,"hview":144,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1280,"wview":256,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1024,"hspeed":-1,"hview":1024,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}