FROM fuzzers/afl:2.52

RUN apt-get update
RUN apt install -y build-essential wget git clang cmake  automake autotools-dev  libtool zlib1g zlib1g-dev libexif-dev \
    libjpeg-dev 
RUN git clone https://github.com/d99kris/rapidcsv.git
WORKDIR /rapidcsv
RUN cmake -DCMAKE_C_COMPILER=afl-clang -DCMAKE_CXX_COMPILER=afl-clang++ -DCMAKE_BUILD_TYPE=Release .
RUN make
COPY fuzzers/f1.cpp .
RUN afl-clang++ -I./src/ f1.cpp -o /x
RUN mkdir /rapidcsvCorpus
RUN cp ./examples/*.csv /rapidcsvCorpus
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/airtravel.csv
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/biostats.csv
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/example.csv
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/homes.csv
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/hooke.csv
RUN wget https://people.sc.fsu.edu/~jburkardt/data/csv/cities.csv
RUN mv *.csv /rapidcsvCorpus
ENV LD_LIBRARY_PATH=/usr/local/lib/

ENTRYPOINT ["afl-fuzz", "-i", "/rapidcsvCorpus", "-o", "/rapidcsvOut"]
CMD ["/x", "@@"]
