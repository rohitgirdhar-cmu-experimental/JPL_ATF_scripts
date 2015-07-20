CODE_PATH=/home/rgirdhar/data/Work/Code/0001_FeatureExtraction/ComputeFeatures/Features/CNN/ver2/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CODE_PATH}/../external/caffe/build/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rgirdhar/data/Software/cpp/zeromq/install/lib
GLOG_logtostderr=0 ${CODE_PATH}/computeFeatures.bin \
    -i /memexdata/Dataset/processed/0007_JPL_ATF/Images/corpus/ \
    -q /memexdata/Dataset/processed/0007_JPL_ATF/Images/lists/Images.txt \
    -n ${CODE_PATH}/../deploy_memexgpu.prototxt \
    -m /home/rgirdhar/data/Software/vision/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel \
    -l pool5 \
    -s \
    -x /memexdata/Dataset/processed/0007_JPL_ATF/Features/Segments_renamed/ \
    -o /memexdata/Dataset/processed/0007_JPL_ATF/Features/CNN/pool5_bg_normed \
    -y \
    -t lmdb \
    -p avg 
