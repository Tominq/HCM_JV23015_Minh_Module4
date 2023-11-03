use quanlydiemsv;

select masv, hosv, tensv, hocbong
from dmsv
order by MaSV;

SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
FROM DMSV
ORDER BY Phai ASC;

SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, HocBong
FROM DMSV
ORDER BY NgaySinh ASC, HocBong DESC;

select MaMH, TenMH, SoTiet
from dmmh
where TenMH like 'T%';

# -- Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
# các thông tin: Họ tên sinh viên, Ngày sinh, Phái.

select CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
from dmsv
where TenSV like '%i';

# 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
# các thông tin: Mã khoa, Tên khoa.

select MaKhoa, TenKhoa
from dmkhoa
where substring(TenKhoa, 2, 1) = 'N';

select *
from dmsv
where HoSV like '%Thị%';

select MaSV, HoSV, TenSV, Phai, MaKhoa, HocBong
from dmsv
where HocBong > 100000
order by MaKhoa desc;

select HoSV, TenSV, NoiSinh, MaKhoa, HocBong
from dmsv
where HocBong > 100000
  and NoiSinh = 'Hà Nội';

select MaSV, dmsv.MaKhoa, Phai
from dmsv
         join dmkhoa
              on dmsv.MaKhoa = dmkhoa.MaKhoa
where TenKhoa = 'Anh văn'
   or TenKhoa = 'Vật lý';

select MaSV, NgaySinh, NoiSinh, HocBong
from dmsv
where NgaySinh between '1991-01-01' and '1992-06-05';

select MaSV, NgaySinh, Phai, MaKhoa, HocBong
from dmsv
where HocBong between 80000 and 150000;

select MaMH, TenMH, SoTiet
from dmmh
where SoTiet between 30 and 45;

select dmsv.MaKhoa, HoSV, TenSV, TenKhoa, Phai
from dmsv
         join dmkhoa
              on dmsv.MaKhoa = dmkhoa.MaKhoa
where Phai = 'Nam'
  and TenKhoa = 'Anh văn';

select *
from dmsv
where TenSV like '%N%'
  and Phai = 'Nữ';

select HoSV, TenSV, NoiSinh, NgaySinh
from dmsv
where NoiSinh = 'Hà Nội'
  and month(NgaySinh) = 3;

SELECT *
FROM DMSV
WHERE YEAR(CURDATE()) - YEAR(NgaySinh) > 20;

SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, YEAR(CURDATE()) - YEAR(NgaySinh) AS Tuoi, TenKhoa
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE YEAR(CURDATE()) - YEAR(NgaySinh) BETWEEN 20 AND 25;

SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
FROM DMSV
WHERE MONTH(NgaySinh) BETWEEN 1 AND 3
  AND YEAR(NgaySinh) = 1990;

select MaSV,
       Phai,
       MaKhoa,
       case
           when HocBong > 500000 then ' Học bổng cao'
           else 'Mức trung bình'
           end as MucHocBong
from dmsv;

select count(MaSV) as Soluong
from dmsv;

SELECT COUNT(*)                                AS TongSinhVien,
       COUNT(CASE WHEN Phai = 'Nữ' THEN 1 END) AS TongSinhVienNu
FROM DMSV;

select dmkhoa.TenKhoa, count(MaSV) as TongSinhVien
from dmkhoa
         join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmkhoa.TenKhoa;

SELECT DMMH.MaMH, DMMH.TenMH, COUNT(DISTINCT DMSV.MaSV) AS NumberOfStudents
FROM DMMH
         LEFT JOIN KetQua ON DMMH.MaMH = KetQua.MaMH
         LEFT JOIN DMSV ON KetQua.MaSV = DMSV.MaSV
GROUP BY DMMH.MaMH, DMMH.TenMH;

SELECT KetQua.MaSV, DMSV.HoSV, DMSV.TenSV, COUNT(DISTINCT KetQua.MaMH) AS NumberOfSubjects
FROM KetQua
         LEFT JOIN DMSV ON KetQua.MaSV = DMSV.MaSV
GROUP BY KetQua.MaSV, DMSV.HoSV, DMSV.TenSV;

select dmsv.MaKhoa, TenKhoa, count(HocBong) as SoLuongHocBong
from dmkhoa
         left join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmsv.MaKhoa, TenKhoa;

select dmsv.MaKhoa, TenKhoa, max(HocBong) as MaxHocBong
from dmkhoa
         left join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmsv.MaKhoa, TenKhoa;

select dmsv.MaKhoa,
       TenKhoa,
       sum(case
               when Phai = 'Nam' then 1
               else 0 end
       ) as SoLuongNam,
       sum(case
               when Phai = 'Nữ' then 1
               else 0 end
       ) as SoLuongNữ
from dmkhoa
         left join dmsv on dmkhoa.MaKhoa = dmsv.MaKhoa
group by dmsv.MaKhoa, TenKhoa;

SELECT CASE
           WHEN DATEDIFF(CURDATE(), DMSV.NgaySinh) / 365 <= 20 THEN '0 - 20'
           WHEN DATEDIFF(CURDATE(), DMSV.NgaySinh) / 365 <= 25 THEN '21 - 25'
           WHEN DATEDIFF(CURDATE(), DMSV.NgaySinh) / 365 <= 30 THEN '26 - 30'
           ELSE '31+'
           END          AS AgeGroup,
       COUNT(DMSV.MaSV) AS NumberOfStudents
FROM DMSV
GROUP BY AgeGroup;

SELECT YEAR(DMSV.NgaySinh) AS BirthYear, COUNT(DMSV.MaSV) AS StudentCount
FROM DMSV
GROUP BY BirthYear
HAVING COUNT(DMSV.MaSV) = 2;

select NoiSinh
from dmsv
group by NoiSinh
having count(MaSV) >= 2;

select dmmh.MaMH, TenMH, count(distinct MaSV) as studentCount
from ketqua
         join dmmh on ketqua.MaMH = dmmh.MaMH
group by dmmh.MaMH, TenMH
having count(distinct MaSV) >= 3;

select dmsv.MaSV, HoSV, TenSV, count(*) as ReExamCount
from ketqua
         join dmsv on ketqua.MaSV = dmsv.MaSV
where ketqua.LanThi > 1
group by dmsv.MaSV, TenSV
having count(*) >= 2;

select dmsv.MaSV, HoSV, TenSV, avg(Diem) as AveragerScore
from dmsv
         join ketqua on dmsv.MaSV = ketqua.MaSV
where Phai = 'Nam'
  and ketqua.LanThi = 1
group by dmsv.MaSV, HoSV, TenSV
having avg(Diem) > 7.0;

select dmsv.MaSV, HoSV, TenSV, count(*) as FailedCount
from dmsv
         join ketqua on dmsv.MaSV = ketqua.MaSV
where ketqua.LanThi = 1
  and ketqua.Diem < 5.0
group by dmsv.MaSV, HoSV, TenSV
having count(*) >= 2;

SELECT DMKhoa.MaKhoa, DMKhoa.TenKhoa, COUNT(CASE WHEN DMSV.Phai = 'Nam' THEN 1 END) AS MaleStudentCount
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
GROUP BY DMKhoa.MaKhoa, DMKhoa.TenKhoa
HAVING COUNT(CASE WHEN DMSV.Phai = 'Nam' THEN 1 END) >= 2;

select dmsv.MaKhoa, TenKhoa, count(*) as HocBongCount
    from dmsv
    join dmkhoa on dmsv.MaKhoa = dmkhoa.MaKhoa
where HocBong between 100000 and 200000
group by dmsv.MaKhoa, TenKhoa
having count(*) >=2;

select dmmh.MaMH, TenMH,
       sum(case when Diem >=5 then 1 else 0 end) as Đậu,
       sum(case when Diem <5 then 1 else 0 end) as Rớt
    from dmmh
    join ketqua on dmmh.MaMH = ketqua.MaMH
    where LanThi =1
group by dmmh.MaMH, TenMH;

select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong
    from dmsv
    where HocBong = (select max(HocBong) from dmsv);
SELECT
	sv.TenSV
FROM dmsv sv
INNER JOIN ketqua kq ON kq.MaSV =  sv.MaSV
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE mh.TenMH LIKE('Cơ Sở Dữ Liệu')
GROUP BY sv.TenSV;

-- 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
SELECT
	sv.MaSV, sv.TenSV, (year(now()) - year(sv.NgaySinh)) as tuoi
FROM dmsv sv
WHERE (year(now()) - year(sv.NgaySinh)) = (SELECT max((year(now()) - year(sv.NgaySinh)))  as max FROM dmsv sv);

-- 42.Cho biết khoa nào có đông sinh viên nhất.
SELECT
	sv.MaKhoa,
    count(sv.MaKhoa) soluong_Sv
FROM dmkhoa k
LEFT JOIN dmsv sv ON sv.MaKhoa = k.MaKhoa
GROUP BY k.MaKhoa;

-- 43.Cho biết khoa nào có đông nữ nhất.
SELECT
	sv.MaKhoa,
	count(sv.Phai) solg
FROM dmkhoa k
LEFT JOIN dmsv sv ON sv.MaKhoa = k.MaKhoa
WHERE sv.Phai LIKE('Nữ')
GROUP BY k.MaKhoa
HAVING solg = 2;

-- 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
SELECT
	mh.TenMH
FROM ketqua kq
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.LanThi = 1 AND kq.Diem < 5
GROUP BY (mh.TenMH )
ORDER BY count(mh.TenMH) DESC
LIMIT 1;

-- 45.Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn
-- điểm thi văn của sinh viên học khoa anh văn.
SELECT
	sv.TenSV,
    r.kq
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
INNER JOIN (
	SELECT
		kq.MaSV MaSV, kq.MaMH, mh.TenMH, kq.Diem Kq
	FROM ketqua kq
	INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
	WHERE mh.TenMH LIKE('Văn Phạm')
) AS r ON r.MaSV = sv.MaSV
WHERE k.TenKhoa LIKE ('Anh Văn');

-- 46.Cho biết sinh viên có nơi sinh cùng với Hải.
SELECT * FROM dmsv sv2
WHERE sv2.NoiSinh IN (SELECT sv.NoiSinh FROM dmsv sv WHERE sv.TenSV LIKE('Hải'));

-- 47.Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn
SELECT *
FROM dmsv sv1
INNER JOIN dmkhoa k ON k.MaKhoa = sv1.MaKhoa
WHERE
	k.TenKhoa NOT LIKE('Anh Văn')
	AND
    sv1.HocBong > ALL (SELECT sv.HocBong
					FROM dmsv sv
					INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
					WHERE k.TenKhoa LIKE('Anh Văn'));


-- 48.Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
-- học khóa anh văn
SELECT *
FROM dmsv sv1
INNER JOIN dmkhoa k ON k.MaKhoa = sv1.MaKhoa
WHERE
	k.TenKhoa NOT LIKE('Anh Văn')
	AND
    sv1.HocBong > ANY (SELECT sv.HocBong
					FROM dmsv sv
					INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
					WHERE k.TenKhoa LIKE('Anh Văn'));

-- 49. ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm
-- thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
SELECT
	kq.MaSV,
	kq.Diem
FROM ketqua kq
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.LanThi = 2 AND mh.TenMH LIKE('Cơ Sở Dữ Liệu')
HAVING kq.Diem >= ALL(SELECT kq.Diem
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE kq.LanThi = 1 AND mh.TenMH LIKE('Cơ Sở Dữ Liệu'));

-- 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
SELECT
    sv.TenSV,
	mh.TenMH,
    kq.Diem
FROM ketqua kq
INNER JOIN dmsv sv ON sv.MaSV = kq.MaSV
INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
WHERE kq.Diem >= ALL (SELECT max(kq.Diem)
				FROM ketqua kq
				INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
				GROUP BY mh.TenMH);

-- 51.Cho biết những khoa không có sinh viên học.
SELECT
	k.MaKhoa,
    k.TenKhoa,
    count(sv.MaKhoa) solg
FROM dmkhoa k
LEFT JOIN dmsv sv ON  sv.MaKhoa = k.MaKhoa
GROUP BY k.MaKhoa
HAVING solg = 0 ;

-- 52.Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
SELECT *
FROM dmsv
WHERE MaSV NOT IN (SELECT kq.MaSV
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE mh.TenMH LIKE('Cơ Sở Dữ Liệu')
					GROUP BY kq.MaSV);

-- 53.Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
SELECT *
FROM
	(SELECT MaSV, MaMH
	 FROM ketqua
     WHERE LanThi = 2) AS A
LEFT JOIN
	(SELECT MaSV, MaMH
	 FROM ketqua
	 WHERE LanThi  = 1
	 ORDER BY MaSV) AS B ON B.MaSV = A.MaSV AND B.MaMH = B.MaMH
HAVING B.MaSV IS NULL
ORDER BY A.MaSV

-- 54.Cho biết môn nào không có sinh viên khoa anh văn học.
SELECT
	mh.TenMH
FROM dmmh mh
LEFT JOIN
	(SELECT DISTINCT kq.MaMH MaMH, kq.MaSV MSV
	 FROM ketqua kq
     WHERE kq.MaSV IN (SELECT sv.MaSV
					   FROM dmsv sv
					   INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
					   WHERE k.TenKhoa LIKE('Anh Văn'))
	) AS B ON B.MaMH = mh.MaMH
WHERE B.MSV IS NULL;

-- 55.Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
SELECT sv.MaSV, sv.TenSV
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE
	k.TenKhoa LIKE ('Anh Văn') AND
    sv.MaSV NOT IN (SELECT kq.MaSV
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE mh.TenMH LIKE ('Văn Phạm'));

-- 56.Cho biết những sinh viên không rớt môn nào.
SELECT sv.MaSV, concat(sv.HoSV, '', sv.TenSV) HoTen, kq.MaMH, kq.Diem, kq.LanThi
FROM dmsv sv
LEFT JOIN ketqua kq ON kq.MaSV = sv.MaSV
WHERE kq.Diem > 5;

-- 57.Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên
-- chưa bao giờ rớt.
SELECT *
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE k.TenKhoa LIKE('Anh Văn') AND sv.HocBong > 0;

-- 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa
-- nào có ít sinh viên nhận học bổng nhất.
SELECT
	k.TenKhoa,
    count(sv.HocBong) so_lg
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE sv.HocBong > 0
GROUP BY k.TenKhoa
HAVING count(sv.HocBong)
IN 	  (SELECT max(A.so_lg) AS `Max`
	   FROM (SELECT k.TenKhoa, count(sv.HocBong) so_lg
			 FROM dmsv sv
			 INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
			 WHERE sv.HocBong > 0
			 GROUP BY k.TenKhoa) AS A);

-- 59.Cho biết 3 sinh viên có học nhiều môn nhất.
SELECT DISTINCT
	kq.MaSV,
    count(kq.MaSV) solg
FROM ketqua kq
GROUP BY kq.MaSV
ORDER BY  count(kq.MaSV) DESC
LIMIT 3;

-- 60.Cho biết những môn được tất cả các sinh viên theo học.
SELECT DISTINCT
	MaMH,
    count(MaMH) slg
FROM ketqua kq
GROUP BY MaMH
ORDER BY MaMH
LIMIT 1;

-- 61.Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
SELECT DISTINCT A.MaSV
FROM
	(SELECT DISTINCT MaSV, MaMH
	FROM quanlydiemsv.ketqua
	WHERE MaSV NOT LIKE ('A02')
	ORDER BY MaSV) AS A
INNER JOIN
	(SELECT DISTINCT MaMH
	FROM ketqua kq
	WHERE MaSV = 'A02') AS B ON B.MaMH = A.MaMH;

-- 62.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02
SELECT  A.MaSV
FROM
	(SELECT DISTINCT MaSV, MaMH
	FROM quanlydiemsv.ketqua
	WHERE MaSV NOT LIKE ('A02')
	ORDER BY MaSV) AS A
WHERE A.MaMH = ALL
	(SELECT DISTINCT MaMH
	FROM ketqua kq
	WHERE MaSV = 'A02');

