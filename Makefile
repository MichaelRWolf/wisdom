# REPO is the absolute path to this Makefile's directory.
# $(CURDIR) is set by make to the directory passed via -C (or cwd if run directly),
# so this works whether invoked as 'make' or 'make -C /path/to/wisdom'.
REPO      := $(CURDIR)
CRON_SCHED = 0 23 * * *
CRON_CMD   = make -C $(REPO) save_quote

.PHONY: save_quote crontab show_crontab

save_quote:
	bin/save-quote

# Install a nightly crontab entry (idempotent — safe to run multiple times).
# MAILTO="" suppresses all cron mail.
crontab:
	@if crontab -l 2>/dev/null | grep -qF '$(CRON_CMD)'; then \
	    echo "crontab: already scheduled — no change"; \
	else \
	    { crontab -l 2>/dev/null; \
	      echo 'MAILTO=""'; \
	      echo '$(CRON_SCHED) $(CRON_CMD)'; \
	    } | crontab -; \
	    echo "crontab: added  $(CRON_SCHED)  $(CRON_CMD)"; \
	fi

# Show whether the crontab entry is installed.
show_crontab:
	@crontab -l 2>/dev/null | grep -F '$(CRON_CMD)' \
	    && echo "(scheduled)" \
	    || echo "(not scheduled)"
