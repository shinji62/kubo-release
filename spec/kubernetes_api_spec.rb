require 'rspec'
require 'spec_helper'

describe 'kube-api server flags' do
  let(:links) do
    {
        'kubernetes-api' => {
            'instances' => {}
        },
        'etcd' => {
            'instances' => {}
        }
    }
  end


  let(:rendered_ctl_script) do
    compiled_template('kubernetes-api', 'bin/kubernetes_api_ctl', {}, links)
  end

  it 'the flag --kubelet-certificate-authority should exist' do
    expect(rendered_ctl_script).to include('--kubelet-certificate-authority')
  end

  it 'the flag --kubelet-client-certificate should exist' do
    expect(rendered_ctl_script).to include(' --kubelet-client-certificate')
  end

  it 'the flag --kubelet-client-key should exist' do
    expect(rendered_ctl_script).to include('--kubelet-client-key')
  end


end
