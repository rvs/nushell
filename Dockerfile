FROM rust:latest
ENV BUILD /usr/src/nu

RUN apt update
RUN apt install -y pkg-config libssl-dev

COPY . $BUILD
WORKDIR $BUILD

COPY . .
RUN cargo build --workspace --features=dataframe

CMD $BUILD/target/debug/nu
