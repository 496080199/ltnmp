#!/bin/bash

install_tengine() {
    echo "--------------------------------------------"
    echo ""
    echo "     Install ${ltnmp_tengine}"
    echo ""
    echo "     By:Andy http://www.moqifei.com"
    echo ""
    echo "--------------------------------------------"

    cd ${current_dir}/src
    tar -zxvf ${ltnmp_tengine}.tar.gz
    cd ${ltnmp_tengine}
    ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_spdy_module --with-http_gzip_static_module --with-ipv6 --with-http_sub_module --with-http_sysguard_module --with-http_concat_module --with-http_realip_module --with-jemalloc --without-dso
    make && make install

    ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx

    mkdir -p /usr/local/nginx/conf/vhost

    cp ${current_dir}/lib/init.d/nginx /etc/init.d/nginx
    chmod +x /etc/init.d/nginx

    # 配置文件调整
    mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.ltnmp
    cp ${current_dir}/lib/conf/*.conf /usr/local/nginx/conf/
    cp ${current_dir}/lib/rewrite/* /usr/local/nginx/conf/

}
