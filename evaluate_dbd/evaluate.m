clc
clear

imgpath = '/Users/weifei/Desktop/result_dut/ours/';
imgpath1 = '/Users/weifei/Desktop/result_dut/DDNet/';
imgpath2 = '/Users/weifei/Desktop/result_dut/CENet/';
imgpath3 = '/Users/weifei/Desktop/result_dut/DCFNet/';
imgpath4 = '/Users/weifei/Desktop/result_dut/SVD/';
imgpath5 = '/Users/weifei/Desktop/result_dut/LBP/';
imgpath6 = '/Users/weifei/Desktop/result_dut/SGNet/';
imgpath7 = '/Users/weifei/Desktop/result_dut/SS/';
imgpath8 = '/Users/weifei/Desktop/result_dut/KSFV/';
imgpath9 = '/Users/weifei/Desktop/result_dut/HiFST/';
imgpath10 = '/Users/weifei/Desktop/result_dut/DBDF/';
GTpath = '/Users/weifei/Desktop/result_dut/gt/';

% ImgEnum=dir([GTpath '*.bmp']);
% ImgNum=length(ImgEnum);
% ids={ImgEnum.name};
% n = ImgNum;
% MAE1 = [];
% tic;
% for i= 1 :n
%     imname_GT = [ GTpath ImgEnum(i).name ];
%     GT = imread(imname_GT);
%     GT = imresize(GT,[160,160]);
%     [ height,width ] = size(GT);
%     for m = 1:height
%         for n = 1:width
%             if GT(m,n)<125
%                 GT(m,n)=255;
%             else
%                 GT(m,n)=0;
%             end
%         end
%     end
%     GT = double(GT);
%     PixNum = height*width;  
%     imname1 = [ imgpath5 ImgEnum(i).name(1:end-4) '.bmp'];
%     Img1 = double( imread( imname1 ) );
%     Img1 = imresize(Img1,[160,160]);
%     for m = 1:height
%         for n = 1:width
%             Img1(m,n)=255-Img1(m,n);
%         end
%     end
%     error1 = abs(Img1-GT(:,:,1))/255;
%     error1_sum = sum(error1(:))/PixNum;
%     MAE1 = [MAE1,error1_sum];
% end
basedir = GTpath;
gt_dir = { 'best', basedir };

alg_dir = ...
{
        {'Ours', imgpath, [], '', 'bmp'};
        {'DDNet', imgpath1, [], '', 'bmp'};
        {'CENet', imgpath2, [], '', 'bmp'};
        {'DCFNet', imgpath3, [], '', 'bmp'};
        {'SVD', imgpath4, [], '', 'bmp'};
        {'LBP', imgpath5, [], '', 'bmp'};
        {'DAD', imgpath6, [], '', 'bmp'};
        {'SS', imgpath7, [], '', 'bmp'};
        {'KSFV', imgpath8, [], '', 'bmp'};
        {'HiFST', imgpath9, [], '', 'bmp'};
        {'DBDF', imgpath10, [], '', 'bmp'};
        
};
addpath ('./subcode/');
alg_dir_FF = candidateAlgStructure( alg_dir );
dataset = datasetStructure( gt_dir(1), gt_dir(2) );

[ mPre, mRecall, mFmeasure, mFmeasureWF , mFalseAlarm, AUC ] = ...
performCalcu(dataset,alg_dir_FF);

x = 0:.05:1;
y = flip(mFmeasureWF);
auc = trapz(x,y)



save( [ basedir 'base_', gt_dir{1} ], 'mPre', 'mRecall', 'mFmeasure', 'mFmeasureWF', 'mFalseAlarm', 'AUC' );
curve_bar_plot_b( basedir, gt_dir, alg_dir, mPre, mRecall, mFmeasure, mFmeasureWF , mFalseAlarm);
% MAE_11 = sum(MAE1)/ ImgNum
disp(['FMeasure=']);
disp([mFmeasure(3,:)]);
toc;