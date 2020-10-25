FROM python:3.8-buster

RUN mkdir /opt/nut -p
COPY . /opt/nut
WORKDIR /opt/nut

RUN pip3 install -r requirements.txt
RUN mkdir /etc/udev/rules.d/ -p
RUN echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="27e2", GROUP="plugdev"' >> /etc/udev/rules.d/99-switch.rules
CMD ["python3 nut.py"]
