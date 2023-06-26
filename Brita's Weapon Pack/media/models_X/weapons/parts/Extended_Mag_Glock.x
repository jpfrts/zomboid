xof 0303txt 0032

template Frame {
  <3d82ab46-62da-11cf-ab39-0020af71e433>
  [...]
}

template Matrix4x4 {
  <f6f23f45-7686-11cf-8f52-0040333594a3>
  array FLOAT matrix[16];
}

template FrameTransformMatrix {
  <f6f23f41-7686-11cf-8f52-0040333594a3>
  Matrix4x4 frameMatrix;
}

template Vector {
  <3d82ab5e-62da-11cf-ab39-0020af71e433>
  FLOAT x;
  FLOAT y;
  FLOAT z;
}

template MeshFace {
  <3d82ab5f-62da-11cf-ab39-0020af71e433>
  DWORD nFaceVertexIndices;
  array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
  <3d82ab44-62da-11cf-ab39-0020af71e433>
  DWORD nVertices;
  array Vector vertices[nVertices];
  DWORD nFaces;
  array MeshFace faces[nFaces];
  [...]
}

template MeshNormals {
  <f6f23f43-7686-11cf-8f52-0040333594a3>
  DWORD nNormals;
  array Vector normals[nNormals];
  DWORD nFaceNormals;
  array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
  <f6f23f44-7686-11cf-8f52-0040333594a3>
  FLOAT u;
  FLOAT v;
}

template MeshTextureCoords {
  <f6f23f40-7686-11cf-8f52-0040333594a3>
  DWORD nTextureCoords;
  array Coords2d textureCoords[nTextureCoords];
}

template ColorRGBA {
  <35ff44e0-6c7c-11cf-8f52-0040333594a3>
  FLOAT red;
  FLOAT green;
  FLOAT blue;
  FLOAT alpha;
}

template IndexedColor {
  <1630b820-7842-11cf-8f52-0040333594a3>
  DWORD index;
  ColorRGBA indexColor;
}

template MeshVertexColors {
  <1630b821-7842-11cf-8f52-0040333594a3>
  DWORD nVertexColors;
  array IndexedColor vertexColors[nVertexColors];
}

template VertexElement {
  <f752461c-1e23-48f6-b9f8-8350850f336f>
  DWORD Type;
  DWORD Method;
  DWORD Usage;
  DWORD UsageIndex;
}

template DeclData {
  <bf22e553-292c-4781-9fea-62bd554bdd93>
  DWORD nElements;
  array VertexElement Elements[nElements];
  DWORD nDWords;
  array DWORD data[nDWords];
}

Frame DXCC_ROOT {
  FrameTransformMatrix {
     1.00000000, 0.00000000, 0.00000000, 0.00000000,
    0.00000000, 1.00000000, 0.00000000, 0.00000000,
    0.00000000, 0.00000000, 1.00000000, 0.00000000,
    0.00000000, 0.00000000, 0.00000000, 1.00000000;;
  }

  Frame 70sw5vfokwie_obj {
    FrameTransformMatrix {
       1.00000000, 0.00000000, -0.00000000, 0.00000000,
      0.00000000, 1.00000000, -0.00000000, 0.00000000,
      -0.00000000, -0.00000000, 1.00000000, -0.00000000,
      0.00000000, 0.00000000, -0.00000000, 1.00000000;;
    }

    Frame Box028_Mesh_004 {
      FrameTransformMatrix {
         1.00000000, 0.00000000, -0.00000000, 0.00000000,
        0.00000000, 1.00000000, -0.00000000, 0.00000000,
        -0.00000000, -0.00000000, 1.00000000, -0.00000000,
        0.00000000, 0.00000000, -0.00000000, 1.00000000;;
      }

      Mesh Box028_Mesh_004_mShape {
        232;
        -0.00661000;0.03957500;0.00649700;,
        -0.00661000;0.01201700;0.00384000;,
        -0.00330500;0.01201700;0.00384000;,
        -0.00330500;0.03957500;0.00649700;,
        -0.00330500;0.03957500;0.00649700;,
        -0.00330500;0.01201700;0.00384000;,
        -0.00000000;0.01201700;0.00384000;,
        -0.00000000;0.03957500;0.00649700;,
        -0.00000000;0.03957500;0.00649700;,
        -0.00000000;0.01201700;0.00384000;,
        0.00330500;0.01201700;0.00384000;,
        0.00330500;0.03957500;0.00649700;,
        0.00330500;0.03957500;0.00649700;,
        0.00330500;0.01201700;0.00384000;,
        0.00661100;0.01201700;0.00384000;,
        0.00661100;0.03957500;0.00649700;,
        -0.00670100;-0.00726300;0.14985000;,
        -0.00335000;-0.00726300;0.14985000;,
        -0.00335000;-0.03942100;0.14674900;,
        -0.00670100;-0.03942100;0.14674900;,
        -0.00335000;-0.00726300;0.14985000;,
        0.00000000;-0.00726300;0.14985000;,
        0.00000000;-0.03942100;0.14674900;,
        -0.00335000;-0.03942100;0.14674900;,
        0.00000000;-0.00726300;0.14985000;,
        0.00335000;-0.00726300;0.14985000;,
        0.00335000;-0.03942100;0.14674900;,
        0.00000000;-0.03942100;0.14674900;,
        0.00335000;-0.00726300;0.14985000;,
        0.00670100;-0.00726300;0.14985000;,
        0.00670100;-0.03942100;0.14674900;,
        0.00335000;-0.03942100;0.14674900;,
        -0.00661000;0.00460900;0.10814400;,
        -0.00661000;-0.02294900;0.10548700;,
        -0.00661000;0.01201700;0.00384000;,
        -0.00661000;0.03957500;0.00649700;,
        -0.00661000;-0.02294900;0.10548700;,
        -0.00330500;-0.02294900;0.10548700;,
        -0.00330500;0.01201700;0.00384000;,
        -0.00661000;0.01201700;0.00384000;,
        -0.00330500;-0.02294900;0.10548700;,
        -0.00000000;-0.02294900;0.10548700;,
        -0.00000000;0.01201700;0.00384000;,
        -0.00330500;0.01201700;0.00384000;,
        -0.00000000;-0.02294900;0.10548700;,
        0.00330500;-0.02294900;0.10548700;,
        0.00330500;0.01201700;0.00384000;,
        -0.00000000;0.01201700;0.00384000;,
        0.00330500;-0.02294900;0.10548700;,
        0.00661000;-0.02294900;0.10548700;,
        0.00661100;0.01201700;0.00384000;,
        0.00330500;0.01201700;0.00384000;,
        0.00661100;0.01201700;0.00384000;,
        0.00661000;-0.02294900;0.10548700;,
        0.00661000;0.00460900;0.10814400;,
        0.00661100;0.03957500;0.00649700;,
        0.00661000;0.00460900;0.10814400;,
        0.00330500;0.00460900;0.10814400;,
        0.00330500;0.03957500;0.00649700;,
        0.00661100;0.03957500;0.00649700;,
        0.00330500;0.00460900;0.10814400;,
        -0.00000000;0.00460900;0.10814400;,
        -0.00000000;0.03957500;0.00649700;,
        0.00330500;0.03957500;0.00649700;,
        -0.00000000;0.00460900;0.10814400;,
        -0.00330500;0.00460900;0.10814400;,
        -0.00330500;0.03957500;0.00649700;,
        -0.00000000;0.03957500;0.00649700;,
        -0.00330500;0.00460900;0.10814400;,
        -0.00661000;0.00460900;0.10814400;,
        -0.00661000;0.03957500;0.00649700;,
        -0.00330500;0.03957500;0.00649700;,
        -0.00972400;0.00759200;0.10868200;,
        -0.00972400;-0.02456600;0.10558000;,
        -0.00661000;-0.02294900;0.10548700;,
        -0.00661000;0.00460900;0.10814400;,
        -0.00972400;-0.02456600;0.10558000;,
        -0.00486200;-0.02456600;0.10558000;,
        -0.00330500;-0.02294900;0.10548700;,
        -0.00661000;-0.02294900;0.10548700;,
        -0.00486200;-0.02456600;0.10558000;,
        -0.00000000;-0.02456600;0.10558000;,
        -0.00000000;-0.02294900;0.10548700;,
        -0.00330500;-0.02294900;0.10548700;,
        -0.00000000;-0.02456600;0.10558000;,
        0.00486200;-0.02456600;0.10558000;,
        0.00330500;-0.02294900;0.10548700;,
        -0.00000000;-0.02294900;0.10548700;,
        0.00486200;-0.02456600;0.10558000;,
        0.00972400;-0.02456600;0.10558000;,
        0.00661000;-0.02294900;0.10548700;,
        0.00330500;-0.02294900;0.10548700;,
        0.00661000;-0.02294900;0.10548700;,
        0.00972400;-0.02456600;0.10558000;,
        0.00972400;0.00759200;0.10868200;,
        0.00661000;0.00460900;0.10814400;,
        0.00972400;0.00759200;0.10868200;,
        0.00486200;0.00759200;0.10868200;,
        0.00330500;0.00460900;0.10814400;,
        0.00661000;0.00460900;0.10814400;,
        0.00486200;0.00759200;0.10868200;,
        -0.00000000;0.00759200;0.10868200;,
        -0.00000000;0.00460900;0.10814400;,
        0.00330500;0.00460900;0.10814400;,
        -0.00000000;0.00759200;0.10868200;,
        -0.00486200;0.00759200;0.10868200;,
        -0.00330500;0.00460900;0.10814400;,
        -0.00000000;0.00460900;0.10814400;,
        -0.00486200;0.00759200;0.10868200;,
        -0.00972400;0.00759200;0.10868200;,
        -0.00661000;0.00460900;0.10814400;,
        -0.00330500;0.00460900;0.10814400;,
        -0.00972400;-0.00708400;0.14799300;,
        -0.00972400;-0.03924200;0.14489201;,
        -0.00972400;-0.02456600;0.10558000;,
        -0.00972400;0.00759200;0.10868200;,
        -0.00972400;-0.03924200;0.14489201;,
        -0.00486200;-0.03924200;0.14489201;,
        -0.00486200;-0.02456600;0.10558000;,
        -0.00972400;-0.02456600;0.10558000;,
        -0.00486200;-0.03924200;0.14489201;,
        0.00000000;-0.03924200;0.14489201;,
        -0.00000000;-0.02456600;0.10558000;,
        -0.00486200;-0.02456600;0.10558000;,
        0.00000000;-0.03924200;0.14489201;,
        0.00486200;-0.03924200;0.14489201;,
        0.00486200;-0.02456600;0.10558000;,
        -0.00000000;-0.02456600;0.10558000;,
        0.00486200;-0.03924200;0.14489201;,
        0.00972400;-0.03924200;0.14489201;,
        0.00972400;-0.02456600;0.10558000;,
        0.00486200;-0.02456600;0.10558000;,
        0.00972400;-0.02456600;0.10558000;,
        0.00972400;-0.03924200;0.14489201;,
        0.00972400;-0.00708400;0.14799300;,
        0.00972400;0.00759200;0.10868200;,
        0.00972400;-0.00708400;0.14799300;,
        0.00486200;-0.00708400;0.14799300;,
        0.00486200;0.00759200;0.10868200;,
        0.00972400;0.00759200;0.10868200;,
        0.00486200;-0.00708400;0.14799300;,
        0.00000000;-0.00708400;0.14799300;,
        -0.00000000;0.00759200;0.10868200;,
        0.00486200;0.00759200;0.10868200;,
        0.00000000;-0.00708400;0.14799300;,
        -0.00486200;-0.00708400;0.14799300;,
        -0.00486200;0.00759200;0.10868200;,
        -0.00000000;0.00759200;0.10868200;,
        -0.00486200;-0.00708400;0.14799300;,
        -0.00972400;-0.00708400;0.14799300;,
        -0.00972400;0.00759200;0.10868200;,
        -0.00486200;0.00759200;0.10868200;,
        -0.00486200;-0.00708400;0.14799300;,
        -0.00335000;-0.00710700;0.14822599;,
        -0.00670100;-0.00710700;0.14822599;,
        -0.00972400;-0.00708400;0.14799300;,
        0.00000000;-0.00708400;0.14799300;,
        0.00000000;-0.00710700;0.14822599;,
        -0.00335000;-0.00710700;0.14822599;,
        -0.00486200;-0.00708400;0.14799300;,
        0.00486200;-0.00708400;0.14799300;,
        0.00335000;-0.00710700;0.14822599;,
        0.00000000;-0.00710700;0.14822599;,
        0.00000000;-0.00708400;0.14799300;,
        0.00972400;-0.00708400;0.14799300;,
        0.00670100;-0.00710700;0.14822599;,
        0.00335000;-0.00710700;0.14822599;,
        0.00486200;-0.00708400;0.14799300;,
        0.00972400;-0.03924200;0.14489201;,
        0.00670100;-0.03926400;0.14512500;,
        0.00670100;-0.00710700;0.14822599;,
        0.00972400;-0.00708400;0.14799300;,
        0.00486200;-0.03924200;0.14489201;,
        0.00335000;-0.03926400;0.14512500;,
        0.00670100;-0.03926400;0.14512500;,
        0.00972400;-0.03924200;0.14489201;,
        0.00000000;-0.03924200;0.14489201;,
        0.00000000;-0.03926400;0.14512500;,
        0.00335000;-0.03926400;0.14512500;,
        0.00486200;-0.03924200;0.14489201;,
        -0.00486200;-0.03924200;0.14489201;,
        -0.00335000;-0.03926400;0.14512500;,
        0.00000000;-0.03926400;0.14512500;,
        0.00000000;-0.03924200;0.14489201;,
        -0.00972400;-0.03924200;0.14489201;,
        -0.00670100;-0.03926400;0.14512500;,
        -0.00335000;-0.03926400;0.14512500;,
        -0.00486200;-0.03924200;0.14489201;,
        -0.00972400;-0.00708400;0.14799300;,
        -0.00670100;-0.00710700;0.14822599;,
        -0.00670100;-0.03926400;0.14512500;,
        -0.00972400;-0.03924200;0.14489201;,
        -0.00335000;-0.00726300;0.14985000;,
        -0.00670100;-0.00726300;0.14985000;,
        -0.00670100;-0.00710700;0.14822599;,
        -0.00335000;-0.00710700;0.14822599;,
        0.00000000;-0.00726300;0.14985000;,
        -0.00335000;-0.00726300;0.14985000;,
        -0.00335000;-0.00710700;0.14822599;,
        0.00000000;-0.00710700;0.14822599;,
        0.00335000;-0.00726300;0.14985000;,
        0.00000000;-0.00726300;0.14985000;,
        0.00000000;-0.00710700;0.14822599;,
        0.00335000;-0.00710700;0.14822599;,
        0.00670100;-0.00726300;0.14985000;,
        0.00335000;-0.00726300;0.14985000;,
        0.00335000;-0.00710700;0.14822599;,
        0.00670100;-0.00710700;0.14822599;,
        0.00670100;-0.03942100;0.14674900;,
        0.00670100;-0.00726300;0.14985000;,
        0.00670100;-0.00710700;0.14822599;,
        0.00670100;-0.03926400;0.14512500;,
        0.00335000;-0.03942100;0.14674900;,
        0.00670100;-0.03942100;0.14674900;,
        0.00670100;-0.03926400;0.14512500;,
        0.00335000;-0.03926400;0.14512500;,
        0.00000000;-0.03942100;0.14674900;,
        0.00335000;-0.03942100;0.14674900;,
        0.00335000;-0.03926400;0.14512500;,
        0.00000000;-0.03926400;0.14512500;,
        -0.00335000;-0.03942100;0.14674900;,
        0.00000000;-0.03942100;0.14674900;,
        0.00000000;-0.03926400;0.14512500;,
        -0.00335000;-0.03926400;0.14512500;,
        -0.00670100;-0.03942100;0.14674900;,
        -0.00335000;-0.03942100;0.14674900;,
        -0.00335000;-0.03926400;0.14512500;,
        -0.00670100;-0.03926400;0.14512500;,
        -0.00670100;-0.00726300;0.14985000;,
        -0.00670100;-0.03942100;0.14674900;,
        -0.00670100;-0.03926400;0.14512500;,
        -0.00670100;-0.00710700;0.14822599;;
        58;
        4;3,2,1,0;,
        4;7,6,5,4;,
        4;11,10,9,8;,
        4;15,14,13,12;,
        4;19,18,17,16;,
        4;23,22,21,20;,
        4;27,26,25,24;,
        4;31,30,29,28;,
        4;35,34,33,32;,
        4;39,38,37,36;,
        4;43,42,41,40;,
        4;47,46,45,44;,
        4;51,50,49,48;,
        4;55,54,53,52;,
        4;59,58,57,56;,
        4;63,62,61,60;,
        4;67,66,65,64;,
        4;71,70,69,68;,
        4;75,74,73,72;,
        4;79,78,77,76;,
        4;83,82,81,80;,
        4;87,86,85,84;,
        4;91,90,89,88;,
        4;95,94,93,92;,
        4;99,98,97,96;,
        4;103,102,101,100;,
        4;107,106,105,104;,
        4;111,110,109,108;,
        4;115,114,113,112;,
        4;119,118,117,116;,
        4;123,122,121,120;,
        4;127,126,125,124;,
        4;131,130,129,128;,
        4;135,134,133,132;,
        4;139,138,137,136;,
        4;143,142,141,140;,
        4;147,146,145,144;,
        4;151,150,149,148;,
        4;155,154,153,152;,
        4;159,158,157,156;,
        4;163,162,161,160;,
        4;167,166,165,164;,
        4;171,170,169,168;,
        4;175,174,173,172;,
        4;179,178,177,176;,
        4;183,182,181,180;,
        4;187,186,185,184;,
        4;191,190,189,188;,
        4;195,194,193,192;,
        4;199,198,197,196;,
        4;203,202,201,200;,
        4;207,206,205,204;,
        4;211,210,209,208;,
        4;215,214,213,212;,
        4;219,218,217,216;,
        4;223,222,221,220;,
        4;227,226,225,224;,
        4;231,230,229,228;;

        MeshMaterialList {
          1;
          58;
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
          Material {
            1.0; 1.0; 1.0; 1.000000;;
            1.000000;
            0.000000; 0.000000; 0.000000;;
            0.000000; 0.000000; 0.000000;;
            TextureFilename { ""; }
          }
        }

        MeshNormals {
        232;
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;-0.09600000;0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        -0.00000000;0.09600000;-0.99540001;,
        0.64950001;-0.07300000;0.75680000;,
        0.59240001;-0.07730000;0.80190003;,
        1.00000000;0.00000000;-0.00000000;,
        1.00000000;0.00000000;-0.00000000;,
        -0.00000000;0.45960000;0.88810003;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.45960000;0.88810003;,
        -0.00000000;0.94559997;0.32530001;,
        -0.00000000;0.94559997;0.32530001;,
        -1.00000000;-0.00000000;-0.00000000;,
        -0.59240001;-0.07730000;0.80190003;,
        -0.64950001;-0.07300000;0.75680000;,
        -1.00000000;-0.00000000;-0.00000000;,
        -0.00000000;-0.72289997;0.69090003;,
        0.00000000;-0.86250001;0.50610000;,
        -0.00000000;-0.94559997;-0.32530001;,
        -0.00000000;-0.94559997;-0.32530001;,
        0.00000000;-0.86250001;0.50610000;,
        0.00000000;-0.86250001;0.50610000;,
        -0.00000000;-0.94559997;-0.32530001;,
        -0.00000000;-0.94559997;-0.32530001;,
        0.00000000;-0.86250001;0.50610000;,
        0.00000000;-0.86250001;0.50610000;,
        -0.00000000;-0.94559997;-0.32530001;,
        -0.00000000;-0.94559997;-0.32530001;,
        0.00000000;-0.86250001;0.50610000;,
        -0.00000000;-0.72289997;0.69090003;,
        -0.00000000;-0.94559997;-0.32530001;,
        -0.00000000;-0.94559997;-0.32530001;,
        0.86420000;-0.04830000;0.50080001;,
        0.86879998;-0.04750000;0.49290001;,
        0.59240001;-0.07730000;0.80190003;,
        0.64950001;-0.07300000;0.75680000;,
        -0.00000000;0.82480001;0.56550002;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.45960000;0.88810003;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.60420001;0.79689997;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.82480001;0.56550002;,
        -0.00000000;0.45960000;0.88810003;,
        -0.00000000;0.60420001;0.79689997;,
        -0.59240001;-0.07730000;0.80190003;,
        -0.86879998;-0.04750000;0.49290001;,
        -0.86420000;-0.04830000;0.50080001;,
        -0.64950001;-0.07300000;0.75680000;,
        0.00000000;-0.99159998;0.12970001;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86250001;0.50610000;,
        -0.00000000;-0.72289997;0.69090003;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86250001;0.50610000;,
        0.00000000;-0.86250001;0.50610000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86250001;0.50610000;,
        0.00000000;-0.86250001;0.50610000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.99159998;0.12970001;,
        -0.00000000;-0.72289997;0.69090003;,
        0.00000000;-0.86250001;0.50610000;,
        1.00000000;0.00000000;-0.00000000;,
        1.00000000;0.00000000;-0.00000000;,
        0.86879998;-0.04750000;0.49290001;,
        0.86420000;-0.04830000;0.50080001;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.82480001;0.56550002;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.59380001;0.80460000;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.93680000;0.34970000;,
        -0.00000000;0.82480001;0.56550002;,
        -0.00000000;0.59380001;0.80460000;,
        -0.86879998;-0.04750000;0.49290001;,
        -1.00000000;-0.00000000;-0.00000000;,
        -1.00000000;-0.00000000;-0.00000000;,
        -0.86420000;-0.04830000;0.50080001;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.99159998;0.12970001;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.93680000;-0.34970000;,
        0.00000000;-0.99159998;0.12970001;,
        0.00000000;-0.86900002;0.49480000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        -0.07710000;0.09570000;-0.99239999;,
        -0.07710000;0.09570000;-0.99239999;,
        -0.07710000;0.09570000;-0.99239999;,
        -0.07710000;0.09570000;-0.99239999;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        0.07710000;0.09570000;-0.99239999;,
        0.07710000;0.09570000;-0.99239999;,
        0.07710000;0.09570000;-0.99239999;,
        0.07710000;0.09570000;-0.99239999;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        0.00000000;-0.99540001;-0.09600000;,
        -1.00000000;-0.00000000;-0.00000000;,
        -1.00000000;-0.00000000;-0.00000000;,
        -1.00000000;-0.00000000;-0.00000000;,
        -1.00000000;-0.00000000;-0.00000000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        -0.00000000;0.99540001;0.09600000;,
        1.00000000;0.00000000;-0.00000000;,
        1.00000000;0.00000000;-0.00000000;,
        1.00000000;0.00000000;-0.00000000;,
        1.00000000;0.00000000;-0.00000000;;
        58;
        4;3,2,1,0;,
        4;7,6,5,4;,
        4;11,10,9,8;,
        4;15,14,13,12;,
        4;19,18,17,16;,
        4;23,22,21,20;,
        4;27,26,25,24;,
        4;31,30,29,28;,
        4;35,34,33,32;,
        4;39,38,37,36;,
        4;43,42,41,40;,
        4;47,46,45,44;,
        4;51,50,49,48;,
        4;55,54,53,52;,
        4;59,58,57,56;,
        4;63,62,61,60;,
        4;67,66,65,64;,
        4;71,70,69,68;,
        4;75,74,73,72;,
        4;79,78,77,76;,
        4;83,82,81,80;,
        4;87,86,85,84;,
        4;91,90,89,88;,
        4;95,94,93,92;,
        4;99,98,97,96;,
        4;103,102,101,100;,
        4;107,106,105,104;,
        4;111,110,109,108;,
        4;115,114,113,112;,
        4;119,118,117,116;,
        4;123,122,121,120;,
        4;127,126,125,124;,
        4;131,130,129,128;,
        4;135,134,133,132;,
        4;139,138,137,136;,
        4;143,142,141,140;,
        4;147,146,145,144;,
        4;151,150,149,148;,
        4;155,154,153,152;,
        4;159,158,157,156;,
        4;163,162,161,160;,
        4;167,166,165,164;,
        4;171,170,169,168;,
        4;175,174,173,172;,
        4;179,178,177,176;,
        4;183,182,181,180;,
        4;187,186,185,184;,
        4;191,190,189,188;,
        4;195,194,193,192;,
        4;199,198,197,196;,
        4;203,202,201,200;,
        4;207,206,205,204;,
        4;211,210,209,208;,
        4;215,214,213,212;,
        4;219,218,217,216;,
        4;223,222,221,220;,
        4;227,226,225,224;,
        4;231,230,229,228;;
        }

        MeshTextureCoords {
        232;
        0.00259000;0.19385701;,
        0.17527500;0.19385701;,
        0.17527500;0.14610898;,
        0.00259000;0.14610898;,
        0.00259000;0.14610898;,
        0.17527500;0.14610898;,
        0.17527500;0.09836102;,
        0.00259000;0.09836102;,
        0.00259000;0.09836102;,
        0.17527500;0.09836102;,
        0.17527500;0.05061299;,
        0.00259000;0.05061299;,
        0.00259000;0.05061299;,
        0.17527500;0.05061299;,
        0.17527500;0.00286502;,
        0.00259000;0.00286502;,
        0.00302300;0.19962603;,
        0.00302300;0.24802703;,
        0.20457201;0.24802703;,
        0.20457201;0.19962603;,
        0.00302300;0.24802703;,
        0.00302300;0.29642802;,
        0.20457201;0.29642802;,
        0.20457201;0.24802703;,
        0.00302300;0.29642802;,
        0.00302300;0.34482998;,
        0.20457201;0.34482998;,
        0.20457201;0.29642802;,
        0.00302300;0.34482998;,
        0.00302300;0.39323097;,
        0.20457201;0.39323097;,
        0.20457201;0.34482998;,
        0.61692297;0.39960003;,
        0.44895601;0.36413002;,
        0.44895601;0.95513397;,
        0.61692297;0.99060297;,
        0.22646900;0.99120599;,
        0.28064799;0.99120599;,
        0.28064799;0.40492898;,
        0.22646900;0.40492898;,
        0.28064799;0.99120599;,
        0.33482701;0.99120599;,
        0.33482701;0.40492898;,
        0.28064799;0.40492898;,
        0.33482701;0.99120599;,
        0.38900599;0.99120599;,
        0.38900599;0.40492898;,
        0.33482701;0.40492898;,
        0.38900599;0.99120599;,
        0.44318500;0.99120599;,
        0.44318500;0.40492898;,
        0.38900599;0.40492898;,
        0.62196201;0.39960003;,
        0.62196201;0.99060297;,
        0.78992897;0.95513302;,
        0.78992897;0.36413002;,
        0.21996699;0.40492898;,
        0.16578799;0.40492898;,
        0.16578799;0.99120599;,
        0.21996699;0.99120599;,
        0.16578799;0.40492898;,
        0.11160900;0.40492898;,
        0.11160900;0.99120599;,
        0.16578799;0.99120599;,
        0.11160900;0.40492898;,
        0.05743000;0.40492898;,
        0.05743000;0.99120599;,
        0.11160900;0.99120599;,
        0.05743000;0.40492898;,
        0.00325100;0.40492898;,
        0.00325100;0.99120599;,
        0.05743000;0.99120599;,
        0.79547101;0.99578601;,
        0.99697697;0.99578601;,
        0.98696703;0.95080501;,
        0.81428200;0.95080501;,
        0.99697697;0.99578601;,
        0.99697697;0.92554700;,
        0.98696703;0.90305698;,
        0.98696703;0.95080501;,
        0.99697697;0.92554700;,
        0.99697697;0.85530901;,
        0.98696703;0.85530901;,
        0.98696703;0.90305698;,
        0.99697697;0.85530901;,
        0.99697697;0.78507102;,
        0.98696703;0.80756098;,
        0.98696703;0.85530901;,
        0.99697697;0.78507102;,
        0.99697697;0.71483302;,
        0.98696703;0.75981301;,
        0.98696703;0.80756098;,
        0.98696703;0.75981301;,
        0.99697697;0.71483302;,
        0.79547101;0.71483302;,
        0.81428200;0.75981301;,
        0.79547101;0.71483302;,
        0.79547101;0.78507102;,
        0.81428200;0.80756098;,
        0.81428200;0.75981301;,
        0.79547101;0.78507102;,
        0.79547101;0.85530901;,
        0.81428200;0.85530901;,
        0.81428200;0.80756098;,
        0.79547101;0.85530901;,
        0.79547101;0.92554700;,
        0.81428200;0.90305698;,
        0.81428200;0.85530901;,
        0.79547101;0.92554700;,
        0.79547101;0.99578601;,
        0.81428200;0.95080501;,
        0.81428200;0.90305698;,
        0.61537498;0.32199001;,
        0.61537498;0.14436603;,
        0.44893301;0.17399901;,
        0.44893301;0.35162401;,
        0.96426499;0.41702199;,
        0.96426499;0.34678400;,
        0.79515803;0.34678400;,
        0.79515803;0.41702199;,
        0.96426499;0.34678400;,
        0.96426499;0.27654600;,
        0.79515803;0.27654600;,
        0.79515803;0.34678400;,
        0.96426499;0.27654600;,
        0.96426499;0.20630801;,
        0.79515803;0.20630801;,
        0.79515803;0.27654600;,
        0.96426499;0.20630801;,
        0.96426499;0.13606900;,
        0.79515803;0.13606900;,
        0.79515803;0.20630801;,
        0.21009199;0.36339200;,
        0.37653399;0.39302599;,
        0.37653399;0.21540099;,
        0.21009199;0.18576801;,
        0.96426499;0.70640397;,
        0.96426499;0.63616598;,
        0.79515803;0.63616598;,
        0.79515803;0.70640397;,
        0.96426499;0.63616598;,
        0.96426499;0.56592703;,
        0.79515803;0.56592703;,
        0.79515803;0.63616598;,
        0.96426499;0.56592703;,
        0.96426499;0.49568897;,
        0.79515803;0.49568897;,
        0.79515803;0.56592703;,
        0.96426499;0.49568897;,
        0.96426499;0.42545098;,
        0.79515803;0.42545098;,
        0.79515803;0.49568897;,
        0.96426499;0.49568897;,
        0.96571499;0.51752603;,
        0.96571499;0.46912497;,
        0.96426499;0.42545098;,
        0.96426499;0.56592703;,
        0.96571499;0.56592703;,
        0.96571499;0.51752603;,
        0.96426499;0.49568897;,
        0.96426499;0.63616598;,
        0.96571499;0.61432898;,
        0.96571499;0.56592703;,
        0.96426499;0.56592703;,
        0.96426499;0.70640397;,
        0.96571499;0.66272998;,
        0.96571499;0.61432898;,
        0.96426499;0.63616598;,
        0.61861497;0.35206902;,
        0.66817099;0.35206902;,
        0.66817099;0.17444402;,
        0.61861497;0.17444402;,
        0.96426499;0.20630801;,
        0.96571499;0.22814399;,
        0.96571499;0.17974299;,
        0.96426499;0.13606900;,
        0.96426499;0.27654600;,
        0.96571499;0.27654600;,
        0.96571499;0.22814399;,
        0.96426499;0.20630801;,
        0.96426499;0.34678400;,
        0.96571499;0.32494700;,
        0.96571499;0.27654600;,
        0.96426499;0.27654600;,
        0.96426499;0.41702199;,
        0.96571499;0.37334800;,
        0.96571499;0.32494700;,
        0.96426499;0.34678400;,
        0.37977400;0.39347100;,
        0.42933100;0.39347100;,
        0.42933100;0.21584600;,
        0.37977400;0.21584600;,
        0.97583300;0.51752603;,
        0.97583300;0.46912497;,
        0.96571499;0.46912497;,
        0.96571499;0.51752603;,
        0.97583300;0.56592703;,
        0.97583300;0.51752603;,
        0.96571499;0.51752603;,
        0.96571499;0.56592703;,
        0.97583300;0.61432898;,
        0.97583300;0.56592703;,
        0.96571499;0.56592703;,
        0.96571499;0.61432898;,
        0.97583300;0.66272998;,
        0.97583300;0.61432898;,
        0.96571499;0.61432898;,
        0.96571499;0.66272998;,
        0.67924601;0.35206902;,
        0.67924601;0.17444402;,
        0.66906703;0.17444402;,
        0.66906703;0.35206902;,
        0.97583300;0.22814500;,
        0.97583300;0.17974299;,
        0.96571499;0.17974299;,
        0.96571499;0.22814399;,
        0.97583300;0.27654600;,
        0.97583300;0.22814500;,
        0.96571499;0.22814399;,
        0.96571499;0.27654600;,
        0.97583300;0.32494700;,
        0.97583300;0.27654600;,
        0.96571499;0.27654600;,
        0.96571499;0.32494700;,
        0.97583300;0.37334800;,
        0.97583300;0.32494700;,
        0.96571499;0.32494700;,
        0.96571499;0.37334800;,
        0.43022701;0.21584600;,
        0.43022701;0.39347100;,
        0.44040501;0.39347100;,
        0.44040501;0.21584600;;
        }
      }

    }

  }

}
