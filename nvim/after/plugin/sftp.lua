vim.g.sftp_sync_servers = {
    server1 = {
        local_path = 'C:\\Users\\I570680/work/sapcli',
        remote_path = '/home/jpaluba/work/sapcli/',
        host = '10.236.96.193',
        private_key = '~/work/keys/paluba-laika-openssh',
        username = 'jpaluba'
    }
}

local sftp_group = vim.api.nvim_create_augroup('sftp_sync', { clear = True })
vim.api.nvim_create_autocmd({ 'BufWritePost' } , {
    pattern = '*',
    group = sfpt_group,
    command = 'SftpSend',
})
