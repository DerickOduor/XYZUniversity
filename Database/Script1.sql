

create table faculty
(
	id int not null primary key identity(1,1),
	faculty_name varchar(100) not null,
	faculty_code varchar(100) not null
)

create table department
(
	id int not null primary key identity(1,1),
	faculty_id int not null references faculty(id),
	department_name varchar(100) not null,
	department_code varchar(100)not null
)

create table programme
(
	id int not null primary key identity(1,1),
	programme_name varchar(100) not null,
	department_id int not null references department(id),
	no_of_academic_years int not null,
	semesters_in_years int not null
)

create table study_year
(
	id int not null primary key identity(1,1),
	[year_of_study] int not null
)

create table programme_fee
(
	id int not null primary key identity(1,1),
	study_year_id int not null references study_year(id),
	fee float not null
)

create table student
(
	id int not null primary key identity(1,1),
	first_name varchar(100) not null,
	last_name  varchar(100) not null,
	surname varchar(100) default '',
	admission_number varchar(100) not null,
	department_id int not null references department(id),
	programme_id int not null references programme(id),
	date_of_admission datetime default getdate()
)

create table academic_year
(
	id int not null primary key identity(1,1),
	[year_academic] varchar(50) not null
	
)

create table student_study_year
(
	id int not null primary key identity(1,1),
	student_id int not null references student(id),
	academic_year_id int not null references academic_year(id),
	study_year_id int not null references study_year(id)	
)

create table bank
(
	id int not null primary key identity(1,1),
	bank_name  varchar(100) not null,
	bank_code  varchar(100) not null,
	swift_code varchar(100) not null
)

create table payment
(
	id int not null primary key identity(1,1),
	amount float default (0),
	date_of_payment datetime default getdate(),
	student_id int references student(id),
	bank_id int not null references bank(id),
	payment_method varchar(100) default '',
	channel varchar(100) default ''
)

create procedure create_payment
(
	@student_admission_number varchar(50),
	@bank_swift_code varchar(100),
	@amount float,
	@payment_date datetime,
	@payment_method varchar(100),
	@channel varchar(100)
)
as
begin
	declare @responsecode varchar(3)='001'
	declare @responsemessage varchar(3)='Failed'

	if not exists (select 1 from student where admission_number=@student_admission_number)
	begin
		set @responsecode ='001'
		set @responsemessage ='Student registration number does not exist!'
	end
	else if not exists (select 1 from bank where swift_code=@bank_swift_code)
	begin
		set @responsecode ='001'
		set @responsemessage ='Bank SWIFT code does not exist!'
	end
	else
	begin
		insert into payment(amount,date_of_payment,student_id,bank_id,payment_method,channel)
		values
		(@amount,ISNULL(@payment_date,getdate()),(select top 1 id from student where admission_number=@student_admission_number),(select top 1 id from bank where swift_code=@bank_swift_code),@payment_method,@channel)
	end

	select @responsecode as 'responsecode',@responsemessage as 'responsemessage'
end