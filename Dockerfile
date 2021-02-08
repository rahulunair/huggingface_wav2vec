From ubuntu:20.04
LABEL version="0.0.1-beta"\
      author="rahul" \
      mail="mail@rahul.onl"

RUN apt update &&\
    apt install -y git vim python3 python3-pip libsndfile1 &&\
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
                 torch==1.7.1+cpu \
                 torchvision==0.8.2+cpu \
                 torchaudio===0.7.2 \
                 -f https://download.pytorch.org/whl/torch_stable.html &&\
                 pip3 install --no-cache-dir \
                 transformers ipython soundfile jiwer
RUN git clone https://github.com/huggingface/datasets.git &&\
    cd datasets &&\
    pip3 install . &&\
    rm -rf /workspace/scripts/datasets

WORKDIR /workspace
RUN groupadd -r wave2vec2 && useradd --no-log-init -r -g wave2vec2 user
COPY ./scripts /workspace/scripts
RUN chown user:wave2vec2 /workspace/scripts &&\
    mkdir -p /home/user &&\
    chown user:wave2vec2 /home/user
USER user
CMD bash
