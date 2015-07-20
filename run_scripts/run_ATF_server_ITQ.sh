BASE_PATH=/home/rgirdhar/data/Work/Code/0001_FeatureExtraction/ComputeFeatures/Features/CNN
CODE_PATH=/srv2/rgirdhar/Work/Code/0002_Retrieval/Try/ScalableLSH/Deploy/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BASE_PATH}/external/caffe/build/lib/:/home/rgirdhar/data/Software/cpp/zeromq/install/lib/
GLOG_logtostderr=1 ${CODE_PATH}/computeFeatAndSearch.bin \
    -n ${CODE_PATH}/deploy.prototxt \
    -m /home/rgirdhar/data/Software/vision/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel \
    -l pool5 \
    -i /home/rgirdhar/memexdata/Dataset/processed/0007_JPL_ATF/Search/indexes/bgImg_ITQ_256bit.index \
    -s /home/rgirdhar/memexdata/Dataset/processed/0007_JPL_ATF/Features/CNN/pool5_bg_normed \
    -g /srv2/rgirdhar/Work/Code/0005_ObjSegment/scripts/seg_service_scripts_2/temp-dir/result.jpg \
    --imgslist /home/rgirdhar/memexdata/Dataset/processed/0007_JPL_ATF/Images/lists/Images.txt \
    --nPathParts -1 \
    --port-num 5564 \
    --num-output 100 \
    --nRerank 1000
