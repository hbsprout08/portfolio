create table musicList(
m_name varchar2(10),
m_url varchar2(200)
);

insert into musicList values('rain', './resources/audio/rain.mp3');
insert into musicList values('fire',  './resources/audio/fire.mp3');
insert into musicList values('maemi', './resources/audio/maemi.wav');
insert into musicList values('cafe', './resources/audio/cafe.mp3');

commit;