

DO $seed$
DECLARE
  v_profile_id INTEGER;
BEGIN
  INSERT INTO profiles (name, summary, created_at, updated_at)
  VALUES (
    'Морозов Семён',
    'Middle+ Backend Developer с опытом разработки высоконагруженных серверных приложений. Стек: Node.js, NestJS и TypeScript. Работал с PostgreSQL, MongoDB, Redis, ClickHouse, gRPC, WebSockets, Docker и GitLab CI.',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  )
  RETURNING id INTO v_profile_id;

  INSERT INTO profile_links (profile_id, label, url) VALUES
    (v_profile_id, 'GitHub',   'https://github.com/JustSeme'),
    (v_profile_id, 'LinkedIn', 'https://www.linkedin.com/in/simon-morozov-261b45255/'),
    (v_profile_id, 'Telegram', 'https://t.me/justseme'),
    (v_profile_id, 'Email',    'mailto:simon.morozov.job@gmail.com'),
    (v_profile_id, 'CodeWars', 'https://www.codewars.com/users/JustSemen'),
    (v_profile_id, 'LeetCode', 'https://leetcode.com/u/justSeme/');

  INSERT INTO skills (profile_id, name) VALUES
    (v_profile_id, 'TypeScript'),
    (v_profile_id, 'JavaScript'),
    (v_profile_id, 'Node.js'),
    (v_profile_id, 'NestJS'),
    (v_profile_id, 'Express.js'),
    (v_profile_id, 'REST API'),
    (v_profile_id, 'Swagger'),
    (v_profile_id, 'WebSockets'),
    (v_profile_id, 'gRPC'),
    (v_profile_id, 'PostgreSQL'),
    (v_profile_id, 'SQL'),
    (v_profile_id, 'MongoDB'),
    (v_profile_id, 'NoSQL'),
    (v_profile_id, 'Redis'),
    (v_profile_id, 'ClickHouse'),
    (v_profile_id, 'MinIO'),
    (v_profile_id, 'TypeORM'),
    (v_profile_id, 'Sequelize'),
    (v_profile_id, 'Mongoose'),
    (v_profile_id, 'Docker'),
    (v_profile_id, 'Git'),
    (v_profile_id, 'GitLab CI'),
    (v_profile_id, 'Jest'),
    (v_profile_id, 'Supertest'),
    (v_profile_id, 'TDD'),
    (v_profile_id, 'FFmpeg'),
    (v_profile_id, 'Английский (B1)');

  INSERT INTO experiences (profile_id, company, position, start_date, end_date, achievements)
  VALUES (
    v_profile_id,
    'Юг-Альянс',
    'Backend Developer',
    DATE '2023-07-01',
    NULL,
    ARRAY[
      'Разработал высоконагруженное M2M-приложение для GPS/GLONASS-навигации и IoT-трекинга (NestJS, PostgreSQL, Docker, Sequelize, Git, Jest): обеспечил обработку данных с датчиков в реальном времени для 10000+ устройств.',
      'Настроил документацию REST API (Swagger, NestJS): ускорил интеграцию фронтенд-команды и сократил количество вопросов по контрактам.',
      'Внедрил методологию TDD в Backend-команде, покрыв 90% проекта тестами (Jest, Supertest, NestJS).',
      'Разработал Telegram-ботов с интеграцией внешних API (Monoclick/lak1197) для автоматизации уведомлений и бизнес-процессов (NestJS, Telegraf, PostgreSQL, Sequelize): сократил объём ручных операций для трёх команд (техники, логисты, водители).',
      'Реализовал RTSP-видеосервис на Node.js с FFmpeg-транскодированием, дистрибуцией по RTSP и управлением по WebSockets (Node.js, FFmpeg, WebSockets): внедрил UDP-транспорт, позволяющий подключить 1000+ устройств, ранее недоступных; увеличил число возможных потребителей с 2 до неограниченного числа.',
      'Разработал систему распознавания автомобильных номеров, LPR (OpenCV, Redis Streams, MinIO, Docker, NestJS): внедрение позволило монетизировать функцию как отдельный продукт в тарифной линейке.',
      'Разработал кастомный инструмент миграций БД взамен Sequelize с поддержкой обфусцированного кода в production (PostgreSQL, Sequelize, NestJS).'
    ]::text[]
  );

  INSERT INTO experiences (profile_id, company, position, start_date, end_date, achievements)
  VALUES (
    v_profile_id,
    'MarPla',
    'Backend Developer',
    DATE '2022-05-01',
    DATE '2023-06-30',
    ARRAY[
      'Разработал единый модуль аутентификации и авторизации (JWT, PostgreSQL, Sequelize, Express.js): заменил два разрозненных модуля, устранив небезопасное хранение session-токенов, несогласованную валидацию и риск Privilege Escalation за счёт стандартизации контроля доступа.',
      'Реализовал real-time чат (WebSockets, MongoDB, Mongoose, Express.js): обеспечил нативную коммуникацию пользователей внутри платформы, снизив зависимость от внешних мессенджеров и повысив вовлечённость.',
      'Разработал сервис агрегации данных из 3+ high-load источников (NestJS, ClickHouse, PostgreSQL, Wildberries API, MongoDB): обработал и сохранил 4 млн+ записей без деградации производительности.',
      'Настроил CI и полный релизный CD-флоу для сервиса уведомлений.'
    ]::text[]
  );

  INSERT INTO projects (profile_id, title, url) VALUES
    (v_profile_id, 'Monoclick', 'https://monoclick.io/'),
    (v_profile_id, 'Marpla',    'https://marpla.ru/'),
    (v_profile_id, 'GoMining',  'https://gomining.com/');
END
$seed$;