# Bài 5 – Chẩn đoán và khắc phục 3 sự cố Pipeline CI/CD

## Mục tiêu
Sửa ba lỗi trong `.github/workflows/broken-pipeline.yml`, chạy lại GitHub Actions và lưu ảnh minh chứng.

## Lỗi 1 – Permission Denied
**Nguyên nhân:** `gradlew` không có quyền thực thi trên Ubuntu Runner.

**Cách sửa:** Workflow chạy `chmod +x gradlew` trước `./gradlew clean test build`.

**Kiểm tra:** Bước `Fix Gradle Wrapper permissions` và `Run Gradle tests` phải có dấu tích xanh.

## Lỗi 2 – Authentication Failed
**Nguyên nhân:** Workflow tham chiếu sai tên Secret hoặc token Docker Hub không hợp lệ.

**Cách sửa:** Dùng `${{ secrets.REGISTRY_TOKEN }}` và khai báo repository secrets:
- `REGISTRY_USERNAME`: tên người dùng Docker Hub.
- `REGISTRY_TOKEN`: Docker Hub access token có quyền ghi/push.

Không ghi token trực tiếp trong YAML, báo cáo hoặc ảnh chụp.

## Lỗi 3 – Build Context Error
**Nguyên nhân:** Docker action trỏ sai thư mục build context hoặc Dockerfile.

**Cách sửa:** Vì `Dockerfile` ở thư mục gốc repository, cấu hình:
```yaml
context: .
file: ./Dockerfile
```

## Thứ tự kiểm tra
1. Xác nhận `Dockerfile`, `gradlew`, `build.gradle` ở thư mục gốc.
2. Thêm hai repository secrets trong GitHub Settings → Secrets and variables → Actions.
3. Commit và push workflow lên nhánh `main` (hoặc `master`).
4. Mở tab Actions, vào lần chạy mới nhất.
5. Xác nhận các bước Gradle test, Docker login và Build and push đều thành công.
6. Chụp ảnh màn hình trạng thái xanh và các bước thành công.

## Kết quả thực tế
- Lần chạy workflow: _Điền sau khi chạy_
- Trạng thái: _Điền theo kết quả thực tế_
- Ảnh minh chứng: _Chèn ảnh chụp màn hình Actions tại đây_

## Kết luận
Ba lỗi đã được xử lý trong workflow. Chỉ xác nhận pipeline hoàn tất khi GitHub Actions thực sự chạy thành công.
