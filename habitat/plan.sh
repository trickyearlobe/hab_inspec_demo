pkg_name=hab_inspec_demo
pkg_origin=trickyearlobe
pkg_version="0.1.1"
pkg_maintainer="Richard Nixon <richard.nixon@btinternet.com>"
pkg_license=("Apache-2.0")

pkg_deps=(chef/inspec)
pkg_svc_user="root"
pkg_svc_group="$pkg_svc_user"
pkg_description="A demo of running inspec under Hab with reporting to A2"
pkg_upstream_url="https://github.com/trickyearlobe/hab_inspec_demo"

do_build()
{
	inspec check ${PLAN_CONTEXT}/../inspec_demo
}

do_install()
{
	cp -r ${PLAN_CONTEXT}/../inspec_demo ${PREFIX}/inspec_demo
}
