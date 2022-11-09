--1 Cho số công việc đã tham gia của mỗi giảng viên thuộc bộ môn HTTT. Chỉ xuất 3 giảng viên tham gia hơn 3 công việc--
select tdt.MAGV 
from THAM_GIA_DT tdt, GIAO_VIEN gv  
where gv.MaGV = tdt.MaGV 
AND gv.MaBM = 'HTTT'
group by tdt.MaGV
having count(tdt.STT) > 3 

--2 Cho biết các giảng viên chủ nhiệm hơn 3 đề tài thuộc chủ đề "NGUYÊN CỨU PHÁT TRIỂN"--
select dt.GVCNDT 
from CHU_DE cd , DE_TAI dt, GIAO_VIEN gv
where cd.MaCD = dt.MaCD AND dt.GVCNDT = gv.MaGV
AND TENCD = N'Nghiên cứu phát triển' 
group by cd.MaCD, dt.GVCNDT, gv.HoTen
having COUNT(dt.MaDT) >= 3

--3 Cho biết các bộ môn có hơn 3 giảng viên chủ nhiệm đề tài--
select gv.MaBM
from GIAO_VIEN gv , DE_TAI dt
where gv.MaGV = dt.GVCNDT
group by gv.MaBM 
Having count(dt.GVCNDT) > 3 

--4  Cho biết các khoa có hơn 5 giảng viên--
select bm.MaKhoa
from BO_MON bm , GIAO_VIEN gv
where bm.MaBM = gv.MaBM
group by bm.MaKhoa 
having count(gv.MaGV) > 5 

--5 đếm số đề tài chủ nhiệm của mỗi trưởng khoa--
select k.TRUONGKHOA , count(dt.MADT)
from KHOA k , GIAO_VIEN gv, DE_TAI dt
where gv.MaGV = dt.GVCNDT AND k.TruongKhoa = gv.MaGV 
group by k.TruongKhoa