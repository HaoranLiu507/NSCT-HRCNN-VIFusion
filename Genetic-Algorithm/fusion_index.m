function E = fusion_index(VI_img,IR_img,dynamic_param,static_param)
%% Get index
IM_VI = uint8(HRCNN_exam(dynamic_param,VI_img,static_param));
IM_IR = uint8(HRCNN_exam(dynamic_param,IR_img,static_param));
e1 = entropy(IM_VI);
e2 = entropy(IM_IR);
PSNR1 = psnr(IM_VI,VI_img)/4;
PSNR2 = psnr(IM_IR,IR_img)/4;
SF1 = SpatialFrequency(IM_VI);
SF2 = SpatialFrequency(IM_IR);
E = PSNR1 + PSNR2 + SF1 + SF2 + e1 + e2;

end