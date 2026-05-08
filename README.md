# Simple Note App

---

## Trải nghiệm Giao diện

Giao diện của ứng dụng được tối ưu để mang lại cảm giác tập trung và dễ sử dụng:

* **Phong cách Modern & Warm:** Sử dụng bảng màu tông ấm (Cam đất, Xanh nhạt, Trắng ngà) mang lại cảm giác nhẹ nhàng.
* **Thiết kế phẳng (Flat Design):** Lược bỏ các bóng đổ nặng nề, sử dụng viền siêu mỏng và các góc bo tròn lớn (Border Radius 20).
* **Thanh công cụ linh hoạt:** AppBar có thể chuyển đổi qua lại giữa Tiêu đề thông thường và Thanh Tìm kiếm.
* **Tương tác mượt mà:** Mọi thay đổi dữ liệu đều được cập nhật tức thì trên giao diện nhờ sử dụng Provider.

<p align="center">
  <img src="https://github.com/user-attachments/assets/aed5eaaf-d6cb-4b0b-acd7-903a5b135068" alt="Screenshot Ứng dụng" width="350"/>
  <img src="https://github.com/user-attachments/assets/2a086fa7-da01-408d-a7eb-598a1375db63" alt="Screenshot Ứng dụng" width="350"/>
</p>

---

## Các tính năng nổi bật

Ứng dụng đáp ứng đầy đủ các tính năng cơ bản của một phần mềm ghi chú:

* **Quản lý ghi chú (CRUD):** Dễ dàng tạo mới với tiêu đề và nội dung, xem chi tiết, chỉnh sửa và xóa ghi chú với hộp thoại xác nhận an toàn.
* **Lưu trữ ngoại tuyến:** Tích hợp cơ sở dữ liệu SQLite. Ghi chú của bạn được lưu trữ vĩnh viễn trên thiết bị, không lo mất dữ liệu khi tắt ứng dụng.
* **Theo dõi thời gian:** Hệ thống tự động ghi nhận thời gian tạo và thời gian cập nhật cuối cùng của từng ghi chú.
* **Tìm kiếm:** Lọc ghi chú ngay lập tức theo từ khóa.
* **Sắp xếp:** Hỗ trợ sắp xếp danh sách hiển thị theo thời gian hoặc theo bảng chữ cái.

---

## Công nghệ sử dụng

Dự án sử dụng các công nghệ và thư viện phổ biến trong hệ sinh thái Flutter:

* **Ngôn ngữ:** Dart
* **Framework:** Flutter
* **Local Database:** `sqflite` (SQLite cho Flutter) và `path_provider` (lấy đường dẫn lưu trữ trên thiết bị).
* **State Management:** `provider` (quản lý trạng thái tập trung).
* **Tiện ích khác:** `intl` (định dạng hiển thị ngày tháng).
