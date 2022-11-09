--1--
CREATE proc DSGV
as 
SELECT distinct  gv.MaGV ,count(tgdt.MaDT) as sdt, (select count(dt.GVCNDT)  FROM DE_TAI dt where gv.MaGV = dt.GVCNDT) as sdtcn
FROM GIAO_VIEN gv left join THAM_GIA_DT tgdt on  gv.MaGV = tgdt.MaGV

GROUP BY gv.MaGV ,tgdt.MaDT
go

--2--
create 
--alter
proc DSGV_KINHPHI
as
begin
SELECT MaGV,count(distinct tg.MaDT)
FROM THAM_GIA_DT tg join DE_TAI dt on tg.MaDT=dt.MaDT
where dt.KinhPhi > 100
group by MaGV
having count(distinct tg.MaDT)>=all
                               (SELECT count(distinct tg.MaDT)
 FROM THAM_GIA_DT tg1 join DE_TAI dt on tg1.MaDT=dt.MaDT
 where dt.KinhPhi > 100
 group by MaGV) 
end
go


--3--
create proc DSDT
@MAGV varchar(10)
as
begin
select distinct GV.MaGV,dt.TenDT
from GIAO_VIEN gv,THAM_GIA_DT TGDT,DE_TAI dt
where gv.MaGV=TGDT.MaGV and TGDT.MaDT=dt.MaDT and gv.MaGV=@MAGV
end
go


--4--
create proc UPDATELUONG
@magv varchar(10), @luong float
as
begin

   update GIAO_VIEN
   set LUONG = @luong
   where GIAO_VIEN.MaGV = @magv

end
go


--5--
create procedure DELETENT
@magv varchar(10), @ten varchar(50)
as
begin

   delete from NGUOITHAN
   where MaGV = @magv and Ten = @ten

end
go


--6--
create procedure CapNhatPhuCap_CV
@magv varchar(10), @madt varchar(10), @stt int, @phucap float
as
begin
   
   update THAMGIADT
   set PhuCap = @phucap
   where MaDT = @madt and STT = @stt and MaGV = @magv

end
go
