-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Andrew Brown', 'andrew@exampro.co', 'andrewbrown' ,'MOCK'),
  ('Andrew Bayko', 'bayko@exampro.com', 'bayko' ,'MOCK'),
  ('Londo Mollari','lmollari@centari.com' ,'londo' ,'MOCK'),
  ('Ana Laura', 'analaura.tula@gmail.com', 'anatula' ,'MOCK'),
  ('Ana', 'ana_tula@hotmail.com', 'anatula2' ,'MOCK'),
  ('Ana 2', '4n4@yopmail.com', '4n4' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'anatula' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )