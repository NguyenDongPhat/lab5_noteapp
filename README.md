# 📓 Simple Note App - Hiện đại & Ấm áp

Một ứng dụng ghi chú cá nhân tinh gọn, mượt mà được xây dựng bằng **Flutter**. [cite_start]Dự án được phát triển dựa trên bài thực hành Lab 5 (Đại học Thủ Dầu Một - TDMU) [cite: 1-5], nhưng đã được "lột xác" hoàn toàn về mặt giao diện (UI/UX) theo phong cách thiết kế phẳng, ấm áp và hiện đại.

---

## ✨ Trải nghiệm Giao diện (UI/UX Highlights)

Giao diện của ứng dụng được chăm chút tỉ mỉ, thoát khỏi thiết kế mặc định nhàm chán để mang lại cảm giác thư giãn và tập trung cho người dùng:

* 🎨 **Phong cách Modern & Warm:** Sử dụng bảng màu Earth Tones (Cam đất / Xanh nhạt kết hợp Trắng ngà) mang lại cảm giác nhẹ nhàng, ấm áp.
* 🔲 **Thiết kế Phẳng (Flat Design):** Lược bỏ các bóng đổ nặng nề, sử dụng viền siêu mỏng và các góc bo tròn lớn (Border Radius 20) giúp ứng dụng trông trẻ trung, hiện đại.
* 🔍 **Thanh công cụ Thông minh:** AppBar có thể chuyển đổi linh hoạt giữa Tiêu đề thông thường và Thanh Tìm kiếm (Search Bar) chỉ với một nút bấm.
* [cite_start]⚡ **Tương tác mượt mà:** Mọi thay đổi dữ liệu đều được cập nhật tức thì trên giao diện nhờ sức mạnh của `Provider` [cite: 16-17].

> *(Bạn có thể chèn ảnh chụp màn hình Home Screen và màn hình Chỉnh sửa tại đây)*
> 
> ![Home Screen](link_anh_trang_chu)
> ![Editor Screen](link_anh_chinh_sua)

---

## 🚀 Các Tính Năng Nổi Bật (Core Features)

Dù có thiết kế đơn giản, ứng dụng vẫn đáp ứng đầy đủ và trọn vẹn các tính năng của một ứng dụng ghi chú tiêu chuẩn:

* [cite_start]📝 **Quản lý Ghi chú (CRUD):** Dễ dàng tạo mới với tiêu đề và nội dung [cite: 8][cite_start], xem chi tiết, chỉnh sửa và xóa ghi chú với hộp thoại xác nhận an toàn [cite: 9-10].
* [cite_start]💾 **Lưu trữ Ngoại tuyến An toàn:** Tích hợp cơ sở dữ liệu `SQLite` [cite: 14-15]. [cite_start]Ghi chú của bạn được lưu trữ vĩnh viễn trên thiết bị (Persistent local storage)[cite: 11], không bao giờ lo mất dữ liệu khi tắt app.
* [cite_start]⏱️ **Theo dõi Thời gian (Timestamp):** Hệ thống tự động ghi nhận thời gian tạo và thời gian cập nhật cuối cùng của từng ghi chú[cite: 12].
* 🔎 **Tìm kiếm Real-time:** Lọc ghi chú ngay lập tức khi bạn gõ từ khóa.
* 📶 **Sắp xếp Đa dạng:** Hỗ trợ sắp xếp danh sách hiển thị theo Mới nhất, Cũ nhất, hoặc theo Bảng chữ cái (A-Z, Z-A).

---

## 🛠 Công Nghệ Sử Dụng (Tech Stack)

[cite_start]Dự án sử dụng các công nghệ và thư viện phổ biến nhất trong hệ sinh thái Flutter [cite: 13-19]:

* **Ngôn ngữ:** Dart
* **Framework:** Flutter (Material 3)
* [cite_start]**Local Database:** `sqflite` (SQLite cho Flutter) [cite: 42] [cite_start]& `path_provider` (Lấy đường dẫn thiết bị)[cite: 43].
* [cite_start]**State Management:** `provider` (Quản lý trạng thái tập trung)[cite: 44].
* [cite_start]**Tiện ích:** `intl` (Định dạng ngày tháng hiển thị đẹp mắt)[cite: 45].

---

## 💻 Hướng Dẫn Chạy Dự Án

Để trải nghiệm ứng dụng trên máy của bạn, vui lòng làm theo các bước sau:

**1. Clone repository về máy:**
```bash
git clone <đường-dẫn-repo-của-bạn>