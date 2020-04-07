FROM buildpack-deps:buster

RUN apt update && apt-get install -y --no-install-recommends \
	clang-format python3 \
        && rm -rf /var/lib/apt/lists/*

COPY run-clang-format.py .
COPY .clang-format .

RUN ln -s $(pwd)/run-clang-format.py /usr/bin
RUN mkdir /src

WORKDIR /src
ENTRYPOINT ["run-clang-format.py"]