# LCD I2C Demo

This project demonstrates how to interface an LCD display using the I2C protocol with an FPGA. The project is developed using Vivado and targets the ZUBoard.

## Author

- **Name:** Võ Nhật Trường
- **Email:** truong92cdv@gmail.com
- **GitHub:** [truong92cdv](https://github.com/truong92cdv)

## I2C protocol

Đọc thêm về giao thức I2C tại đây [I2C protocol](https://dayhocstem.com/blog/2020/05/giao-dien-ghep-noi-i2c.html)
Giao thức I2C gồm 2 đường tín hiệu: SDA và SCL. Tín hiệu SCL là tín hiệu xung clock do thiết bị Master tạo nhịp, tín hiệu SDA là dữ liệu truyền đi.
Khi Master muốn ghi dữ liệu vào Slave, sẽ trải qua các bước sau:
1. Master gửi tín hiệu START (kéo SDA từ high -> low khi SCL đang giữ mức high).
2. Master gửi địa chỉ Slave cần ghi (frame 8 bit gồm 7 bit addr + bit 0 để chỉ định write).
3. Slave so sánh địa chỉ, nếu trùng khớp, nó sẽ gửi tín hiệu ACK để sẵn sàng nhận dữ liệu là Master (giữ SDA ở mức low khi SCL từ low -> high ở xung nhịp thứ 9).
4. Master gửi 1 byte data. Ghi từng bit vào SDA (MSB first) khi SCL chuyển từ low -> high.
5. Slave gửi tín hiệu ACK. Lặp lại bước 4 và 5 đến khi Master không muốn gửi dữ liệu nữa.
6. Master gửi tín hiệu STOP (kéo SDA từ low -> high khi SCL đang giữ mức high).
Nên nhớ rằng đường tín hiệu SDA và SCL phải được nối với điện trở pull-up (4.7k) để tránh xung đột tín hiệu. Khi Master hoặc Slave muốn kéo tín hiệu xuống low, nó phải gửi tín hiệu low. Còn khi muốn kéo tín hiệu lên high, chỉ cần giải phóng đường tín hiệu để pull-up làm nhiệm vụ kéo đường tín hiệu lên high.

Giao thức truyền nhận dữ liệu khi Master muốn ghi dữ liệu vào Slave:
... add image ...

Waveform mục tiêu cần đạt:
... add image ...

