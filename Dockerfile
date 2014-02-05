from ubuntu:precise

# oRTP, https://openbsc.osmocom.org/trac/wiki/network_from_scratch#oRTP
run curl -O http://download.savannah.gnu.org/releases/linphone/ortp/sources/ortp-0.22.0.tar.gz \
    && tar xvzf ortp-0.22.0.tar.gz \
    && cd ortp-0.22.0 \
    && ./configure && make && make install \
    && ldconfig \
    && cd ..

# libosmocore, https://openbsc.osmocom.org/trac/wiki/network_from_scratch#libosmocore
run git clone git://git.osmocom.org/libosmocore.git \
    && cd libosmocore \
    && autoreconf -i \
    && ./configure && make && make install \
    && ldconfig \
    && cd ..

# libosmo-abis, https://openbsc.osmocom.org/trac/wiki/network_from_scratch#libosmo-abis
run git clone git://git.osmocom.org/libosmo-abis.git \
    && cd libosmo-abis \
    && git checkout -b jolly/multi-trx origin/jolly/multi-trx \
    && autoreconf -i \
    && ./configure && make && make install \
    && ldconfig \
    && cd ..

# OsmoNITB, https://openbsc.osmocom.org/trac/wiki/network_from_scratch#OsmoNITB
run git clone git://git.osmocom.org/openbsc.git \
    && cd openbsc/openbsc/ \
    && git checkout -b jolly/testing origin/jolly/testing \
    && autoreconf -i \
    && ./configure && make && make install \
    cd ../..