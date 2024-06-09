# App quản lý kho và nhân viên
- Mô hình sử dụng: Clean Architecture: tạo ra một cấu trúc mã nguồn rõ ràng và dễ bảo trì, thông qua việc phân tách rõ ràngcác trách nhiệm giữa các thành phần khác nhau của ứng dụng
## Chia làm 3 tầng cơ bản:
- Tầng Presentation**:** Chứa UI (User Interface) và logic xử lý giao diện người dùng (như là Bloc, getX, …)
- Tầng Domain: Định nghĩa các quy tắc nghiệp vụ và các entity (đối tượng nghiệp vụ). Tầng này là lõi của ứng dụng và không phụ thuộc vào bất kỳ tầng nào khác, đảm bảo rằng logic nghiệp vụ có thể được tái sử dụng và kiểm thử dễ dàng.
- Tầng Data: Quản lý truy cập dữ liệu và thực hiện các thao tác dữ liệu, bao gồm giao tiếp với database, mạng, và các dịch vụ.
#### **Presentation**:
- **`pages`**: Chứa các màn hình của ứng dụng.
- **`widgets`**: Các widget tái sử dụng trong ứng dụng.
- **`blocs`** hoặc **`view_models`**: Logic điều khiển trạng thái cho UI.
#### **Domain**:
- **`entities`**: Mô hình dữ liệu không chứa bất kỳ logic ứng dụng cụ thể nào.
- **`use_cases`**: Chứa các tác vụ nghiệp vụ, mô tả "công việc" ứng dụng cần thực hiện.
- **`repositories`**: Interfaces mà lớp Data sẽ cài đặt, giúp giảm sự phụ thuộc giữa lớp Data và Domain.
#### **Data**:
- **`models`**: Mô hình dữ liệu dùng để trao đổi dữ liệu giữa các lớp, thường có các phương thức để chuyển đổi từ/đến Entities.
- **`datasources`**: Cài đặt cụ thể cho việc truy cập dữ liệu, như API hoặc cơ sở dữ liệu địa phương.
- **`repositories`**: Cài đặt cụ thể của interfaces được định nghĩa trong Domain.

## Quản lí state:
- **Flutter Bloc**: Thư viện quản lý trạng thái ứng dụng dựa trên mô hình Bloc.
- **SetState**: Sử dụng cho các trạng thái đơn giản hoặc cần cập nhật trực tiếp trên UI.
## Quản lí route:
- **Auto Route**: Thư viện quản lý route, giúp quản lí route dễ dàng hơn.
## Quản lí Firebase:
- **Firebase Auth**: Đăng nhập, đăng ký, quên mật khẩu.
- **Firebase Firestore**: Lưu trữ dữ liệu.
- **Firebase Storage**: Lưu trữ file ảnh.
## Quản lí Local Database:
- **Sqflite**: Thư viện quản lý cơ sở dữ liệu địa phương.
## Các màn hình chính :
- **Login**: Đăng nhập.
- **Register**: Đăng ký.
- **Home**: Màn hình chính.
- **User**: Thông tin người dùng.
- **User Deatail**: Thông tin người dùng chi tiết, cho phép sửa, xoá
- **User Create**: Tạo mới thông tin người dùng
- **Product**: Quản lí sản phẩm.
- **Product Detail**: Chi tiết sản phẩm, cho phép sửa, xoá
- **Product Create**: Tạo mới sản phẩm
## Cài đặt app trên Android Studio:
    - Clone project về máy.
    - Mở terminal và chạy lệnh: flutter pub get
    - Chạy ứng dụng: flutter run
## Cài đặt app trên máy thật:
    - Build -> Flutter -> Build APK: tải file APK về máy và cài đặt.
