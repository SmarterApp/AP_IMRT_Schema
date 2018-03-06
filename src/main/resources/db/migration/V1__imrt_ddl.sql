/* Primary table containing all types of items and the json data from IAT */
CREATE TABLE item (
  key             SERIAL PRIMARY KEY, -- Primary key for items, auto-incrementing (change serial to AUTO_INCREMENT for mySQL)
  id              VARCHAR     NOT NULL, -- Item ID from the Item Bank
  subject         VARCHAR     NOT NULL,
  grade           VARCHAR     NOT NULL,
  workflow_status VARCHAR     NOT NULL,
  item_type       VARCHAR     NOT NULL,
  dok             VARCHAR     NOT NULL,
  item_created_by VARCHAR     NOT NULL,
  item_created_at TIMESTAMPTZ NOT NULL,
  item_json       JSON        NOT NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by      VARCHAR     NOT NULL
);

CREATE TABLE standard_id (
  item_key             INT         NOT NULL,
  type                 INT         NOT NULL, -- Primary = 1, Secondary = 2, etc
  claim                VARCHAR     NOT NULL,
  content_domain       VARCHAR     NOT NULL,
  target               VARCHAR     NOT NULL,
  emphasis             VARCHAR     NOT NULL,
  common_core_standard VARCHAR     NOT NULL,
  created_at           TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by           VARCHAR     NOT NULL,
  FOREIGN KEY (item_key) REFERENCES item (key),
  PRIMARY KEY (item_key, type)
);

/* Git Information associated with each item */
CREATE TABLE item_git (
  item_key            INT         NOT NULL,
  project_id          INT PRIMARY KEY, -- Unique identifier from GIT
  project_path        VARCHAR     NOT NULL, -- Full path including namespace (group)
  current_commit_hash VARCHAR     NOT NULL,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by          VARCHAR     NOT NULL,
  FOREIGN KEY (item_key) REFERENCES item (key),
  UNIQUE (item_key, project_id)
);

/* Historical item data */
CREATE TABLE item_log (
  item_key    INT         NOT NULL,
  commit_hash VARCHAR     NOT NULL,
  commit_date TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by  VARCHAR     NOT NULL,
  FOREIGN KEY (item_key) REFERENCES item (key),
  PRIMARY KEY (item_key, commit_hash)
);

/* Link Assessment items and stimulii */
CREATE TABLE stim_link (
  item_key      INT         NOT NULL,
  item_key_stim INT         NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by    VARCHAR     NOT NULL,
  FOREIGN KEY (item_key) REFERENCES item (key),
  FOREIGN KEY (item_key_stim) REFERENCES item (key),
  PRIMARY KEY (item_key, item_key_stim)
);

/* Project Locking */
CREATE TABLE project_lock (
  project_id INT         NOT NULL,
  locked_at  TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by VARCHAR     NOT NULL,
  PRIMARY KEY (project_id)
);

/* flywayClean deletes all user privileges, so we will set them here.
   Assumes that that imrt-ingest and imrt-search users have already been created in the database */
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "imrt_ingest";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "imrt_ingest";
GRANT SELECT ON ALL TABLES in schema public to "imrt_search";
GRANT SELECT ON ALL SEQUENCES in schema public to "imrt_search";
